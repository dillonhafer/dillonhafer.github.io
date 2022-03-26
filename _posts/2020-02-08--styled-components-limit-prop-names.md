---
title: 💅 styled-components limit prop names
tag: react
---

💅 styled-components is one of my absolute favorite libraries! ❤️ I just have to be careful not use prop names for my components that could be interpreted as styles.

For example:

```ts
interface Props {
  position: "left-side" | "right-side";
  item: Item;
}

const ListItem= styled.View<{position: "left-side" | "right-side"}>(({position}) => ({
  backgroundColor: position === "left-side" ? "burlywood" : "skyblue";
}));

const ListItemContainer: React.FC<Props> = ({position, item}) => {
  return (
    <ListItem position={position}>
      <Text>{item.name}</Text>
    </ListItem>
  );
}

<ListItemContainer item={item} position="left-side" />
```

This will return an error because in `StyleSheet`, `position` must be one of `absolute` or `relative`
