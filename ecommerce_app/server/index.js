const express = require("express");

const PORT = 3000;

const app = express();
//Createing an API
//GET, PUT, POST, DELETE, UPDATE -> CRUD

app.listen(PORT, "0.0.0.0", () => {
    console.log(`connected at port ${PORT}`);
});
