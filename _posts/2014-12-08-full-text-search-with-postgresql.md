---
title: Full Text Search with PostgreSQL
---

**LET’S GET SOME CONTEXT FIRST, USING A REAL-WORLD APPLICATION**

So you’re building an application for a school district, change of plans, a group of school districts. Wait… why are there different school districts in one application? Because the application is being used by a law firm, who write the district policies, to manage the policies of multiple school districts.

The Policies are all in PDF format, stored on a cloud CDN somewhere, but the firm would like to have full text search available on the PDFs. You grab a PDF parsing library and store the plain text in Postgres whenever a PDF is uploaded.

Now we simply need to write queries against the text in the database! …. (maybe)

**UH-OH… SOMETHING WENT WRONG**

It turns out there are almost 800 PDFs (about 600,000 words). And using a PostgreSQL’s full text search known as ts_vector appears to only take a few seconds (2500ms)… but this is a naive assumption.

```sql
-- Executing query:
SELECT ("sections".*)
FROM "sections"
WHERE (to_tsvector(file_text) @@ to_tsquery('friends'))
Total query runtime: 2673 ms.
9 rows retrieved.
```

The reason this approach is “naive” is because  we are not having to join this table against any other table yet. Remember this application manages multiple districts. In this case, it’s more useful to be able to perform full text search only on the PDFs in a given school district. But this makes it 10 times slower, literally…

```sql
-- Executing query:
SELECT ("sections".*)
FROM "sections"
INNER JOIN "chapters" ON "sections"."chapter_id" = "chapters"."id"
WHERE "chapters"."district_id" = 2
AND (to_tsvector(file_text) @@ to_tsquery('friends'))
Total query runtime: 24944 ms.
4 rows retrieved.
```

**“USE THE INDEX, LUKE” SOUNDS LIKE A SOLUTION**

Yep! This is exactly what indexes were designed for, but understanding how to use them can be quite difficult. If you are not familiar with how SQL indexes work, I advise you to read [Use The Index, Luke](http://use-the-index-luke.com/sql/table-of-contents).

PostgreSQL has [very good documentation](http://www.postgresql.org/docs/9.5/static/textsearch-intro.html) about their ts_vector queries and indexes. There are two kinds of indexes that can be used to speed up full text searches:

- GiST (Generalized Search Tree)-based index. The column can be of `tsvector` or tsquery type.
- GIN (Generalized Inverted Index)-based index. The column must be of `tsvector` type.

We will be using the gin index because it is 3-times faster than gist, and gist indexes have the possibility of returning “false matches”. There are some drawbacks to gin, primarily slow index creation speeds and larger space required to store the index, but those aren’t enough to avoid them for this case.

```sql
CREATE INDEX file_text_idx
  ON sections
  USING gin
  (to_tsvector('english', file_text));

-- Executing query:
Query returned successfully with no result in 3065 ms.
```

Notice the word ‘english’ in the CREATE INDEX statement, this is very important. Because we are calling the to_tsvector function on a text column, and the column is not a tsvector column type, we must give the GIN INDEX a configuration parameter; in this case the word ‘english’, but you can use any word as a configuration parameter.

From now on 2 parameters are needed to use the index:

- The dictionary parameter, ‘english’ in this case.
- The search words. Search words can be concatenated by the ampersand (i.e. ‘friends & parents’, ‘lunch & finances’).

If we did not include ‘english’, the index would never be used.

```sql
-- Executing query:
SELECT ("sections".*)
FROM "sections"
INNER JOIN "chapters" ON "sections"."chapter_id" = "chapters"."id"
WHERE "chapters"."district_id" = 2
AND (to_tsvector('english', file_text) @@ to_tsquery('friends'))
Total query runtime: 227 ms.
4 rows retrieved.

-- CACHE Hit in only 14ms afterwards --

-- Executing query:
SELECT ("sections".*)
FROM "sections"
INNER JOIN "chapters" ON "sections"."chapter_id" = "chapters"."id"
WHERE "chapters"."district_id" = 2
AND (to_tsvector('english', file_text) @@ to_tsquery('friends'))
Total query runtime: 14 ms.
4 rows retrieved.
```

As you can see there is a 1000% performance increase, and subsequent queries see even faster times (14ms).

You will never regret learning how SQL indexes work, experimenting with them, and using them.