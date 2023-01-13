---
title: Check if a form is valid
tag: javascript
---

You can check if a form passes HTML validations with javascript using the `checkValidity` function:

```html
<form name="login">
 <fieldset>
   <legend>Email</legend>
   <input type="email" name="email" required />
 </fieldset>

 <fieldset>
   <legend>Password</legend>
   <input type="password" name="password" required />
 </fieldset>

 <div style="margin-top: 1rem">
   <input type="submit" value="login" />
   <button type="button" id="validate">
    validate
   </button>
 </div>
</form>

<script>
  const button = document.querySelector("#validate")
  if (button) {
    button.addEventListener("click", function() {
      alert(document.forms.login.checkValidity() ? "Form is valid" : "INVALID");
    });
  }
</script>
```
