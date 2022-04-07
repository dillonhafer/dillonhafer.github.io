---
title: Trust Issues 🤔
tag: workflow
---

Our computers trust a scary amount of <a href="https://en.wikipedia.org/wiki/Root_certificate" target="_blank">Root Certificate Authorites</a>, and sometimes I have trust issues with some of them. Most recently being the <a href="http://www.whatissslcertificate.com/attackers-can-exploit-the-vulnerability-in-startssl-for-issuing-ssl-certificates/" target="_blank">StartCom</a> bug, which allowed anyone to get a certificate for any domain they wanted.

I can't trust them. Period. And I don't have to.

Here is how you can revoke trust for any Root CA in OSX:

1. Open Keychain Access. <br />`open /Applications/Utilities/Keychain\ Access.app`
2. Click on `System Roots` from the left `Keychains` sidebar.
3. Type`startcom` in the search bar.
4. Select all the root certificates and press `⌘i`.
5. Expand the `Trust` section<br>and change the option <br>`When using this certificate`<br> to<br> `Never Trust`.
