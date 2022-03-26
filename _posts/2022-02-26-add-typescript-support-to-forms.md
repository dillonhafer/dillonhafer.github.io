---
title: Add TypeScript support to forms
tag: javascript
---

When working with form names, it's nice to have typescript support:

```typescript
interface CustomerFormType extends HTMLFormElement {
  firstName: HTMLInputElement;
  lastName: HTMLInputElement;
}


declare global {
  interface Document {
    newCustomer: CustomerFormType;
  }
}

class CustomerForm extends Component<Props, State> {
  onSubmit = (e) => {
    e.preventDefault();
    const firstName = document.newCustomer.firstName.value;
    const lastName = document.newCustomer.lastName.value;
    console.log({firstName, lastName});
  };

  render() {
    return (
      <form name="newCustomer" onSubmit={this.onSubmit}>
        <input name="firstName" type="text" />
        <input name="lastName" type="text" />
        <button type="submit">Submit</button>
      </form>
    );
  }
}
```
