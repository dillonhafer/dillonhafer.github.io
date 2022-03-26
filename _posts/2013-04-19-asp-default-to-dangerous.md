---
title: ASP&#58; Default to Dangerous
tag: C#
---

ASP.net WebForms applications have always faced a very dangerous flaw: raw HTML, in user entered information, needing to be manually escaped.

Whenever a user inputs information into a form, that information is saved in the database.

You should always HTML encode user data upon displaying, never upon storing.

Save the user input in DB (using parametrized queries to prevent SQL injection) and then HTML encode when outputting the data.

HTML encoding is built into the ASP.NET framework real simply. This is how you do it:

```html
<!-- ASP.NET 3.5 and below -->
<%= Html.Encode(yourStuff) %>

<!-- ASP.NET 4 -->
<%: yourStuff %>
```