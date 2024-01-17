//Import form package
const express = require("express");
const mongoose = require("mongoose");

//Import form other class
const authRouter = require("./routes/auth");
const adminRouter = require("./routes/admin");
const productRouter = require("./routes/product");
const userRouter = require("./routes/user");

//init
const PORT = process.env.PORT || 3000;
const app = express();
const DB =
  "mongodb+srv://immortal:FESVt8Xyr4Dv9k29@cluster0.wfivrjs.mongodb.net/?retryWrites=true&w=majority";

//middleware
app.use(express.json());
app.use(authRouter);
app.use(adminRouter);
app.use(productRouter);
app.use(userRouter);

//connection
mongoose
  .connect(DB)
  .then(() => {
    console.log("Connection successfull");
  })
  .catch((e) => {
    console.log(e);
  });

app.listen(PORT, "0.0.0.0", () => {
  console.log(`connected at port ${PORT}`);
});
