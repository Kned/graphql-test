# README
To run this project:
 - required ruby-2.7.3
 - bundle install
 - rspec
 - rails s
 - Go to http://localhost:3000/graphiql to test the api
 
# Create User mutation
```graphql
mutation {
  addUser(
    input:{
      params: {
        name: "Henrique Fontoura2"
      }
    }
  ){
    user{
      name
    }
  }
}
```
# Create Note mutation
```graphql
mutation {
  addNote(input: {params: {title: "Nota 0001", body: "Textao mano", userId: 1}}) {
    note {
      id
      title
      body
      createdAt
      user {
        id
        name
        createdAt
      }
    }
  }
}
```

# List notes query
```graphql
query {
  fetchNotes(
    userId: 1 #optional filter
  ) {
    id
    title
    body
    createdAt
    user {
      id
      name
      createdAt
    }
  }
}
```

