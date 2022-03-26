---
title: Apollo-React hooks can easily refetch queries
tag: react
---

React-apollo hooks allow you to easily refetch queries after a mutation, which is useful for updating a list when you have create/update/delete mutations.

`useMutation` takes an argument called `refetchQueries` that will run queries named in the array.

```ts
import React from "react";
import { useMutation } from "@apollo/react-hooks";
import gql from "graphql-tag";
import { Button } from "react-native";
import { Item } from "./types";

const ITEM_DELETE = gql`
  mutation ItemDelete($id: ID!) {
    itemDelete(id: $id) {
      id
    }
  }
`;

interface Props {
  item: Item;
}

const DeleteItemButton = ({item}: Props) => {
  const [deleteItem] = useMutation(ITEM_DELETE, {
    variables: { id: item.id },
    refetchQueries: ["GetItemList"],
  });

  return (
    <Button title="Delete" onPress={() => deleteItem()} />
  )
}
```
