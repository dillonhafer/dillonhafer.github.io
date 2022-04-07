---
title: Use react component prop in TypeScript
tag: react
---

Use `JSX.Element` when you want to accept a component as a prop:

```ts
interface Props {
  rightContent: JSX.Element;
}

class Content extends Component {
  render() {
    <Row>
      <Text>Hi There</Text>
      <RightContent>{this.props.rightContent}</RightContainer>
    </Row>
  }
}
```
