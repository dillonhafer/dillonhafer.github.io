---
title: Ecto queries can be combined
tag: elixir
---

Queries can take other queries to build on top of, which is very useful for conditional query logic:

```elixir
def find_posts(group_id, title) do
  posts =
    from(posts in Phoenix.Post,
      where: posts.group_id == ^group_id,
    )
    |> title_search(title)
    |> Phoenix.Repo.all()
end

defp title_search(query, title) do
  query
    |> where([posts], posts.title == ^title)
end

defp title_search(query, nil) do
  query
end
```
