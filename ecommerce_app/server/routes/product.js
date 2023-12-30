const express = require("express");
const productRouter = express.Router();
const auth = require("../middlewares/auth");
const Product = require("../models/product");

productRouter.get("/api/products", auth, async (req, res) => {
  try {
    console.log(req.query.category);
    const product = await Product.find({ category: req.query.category });
    res.json(product);
  } catch (e) {
    res.status(500).json({ error: e.message });
  }
});

//a GEt request to search product adn get them
productRouter.get("/api/products/search/:name", auth, async (req, res) => {
  try {
    const products = await Product.find({
      name: { $regex: req.params.name, $options: "i" },
    });
    res.json(products);
  } catch (e) {
    res.status(500).json({ error: e.message });
  }
});

//post request route to rate the product
productRouter.post("/api/rate-product", auth, async () => {
  try {
    const { id, rating } = req.body;
    let product = await Product.findById(id);

    for (let i = 0; i < product.ratings.length; i++) {
      if ((product.ratings[i].userId = req.user)) {
        product.ratings.splice(i, 1);
        break;
      }
    }
    const ratingSchema = {
      userId: req.user,
      rating,
    };
    product.ratings.push(ratingSchema);
    product = await product.save();
    res.json(product);
  } catch (e) {
    res.status(500).json({ error: e.message });
  }
});
module.exports = productRouter;
