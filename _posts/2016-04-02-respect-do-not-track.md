---
title: Respect Do Not Track 👁‍🗨
---

Before I put google analytics or other third party scripts on my sites I like to respects the [DNT](https://www.w3.org/2011/tracking-protection/drafts/tracking-dnt.html) headers a user has set. Here's how I do it with Google Analytics:

```html
<script>
  if (window.navigator.doNotTrack !== '1') {
    (function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
    (i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),
    m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
    })(window,document,'script','https://www.google-analytics.com/analytics.js','ga');

    ga('create', 'UA-37363195-5', 'auto');
    ga('send', 'pageview');
  }
</script>
```

In the above snippet I check if the user has enabled DNT. If they haven't set the header or they have turned it off the script will run. Checking for `window.navigator.doNotTrack !== '1'` ensures that the user purposely set the header.
