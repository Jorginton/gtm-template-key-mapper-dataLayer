# Key Mapper

This Google Tag Manager variable template maps specified keys from each object in an (e-commerce) array, allowing users to select and extract only the values they need into a new array. This template is primarily used to map keys, such as an e-commerce `item_id`, and returns them in the format `["T12345", "T67890"]`, with a value for each individual product.

This is particularly useful for ad platforms, such as Facebook, which require the `content_ids` parameter in this format to optimize ad performance.

You can choose to map keys from an e-commerce `dataLayer` or use an alternative source (e.g., `eventModel.items`). The variable will look for the specified key and return the values in an array. For example, if using `ecommerce.items` to map `item_name`, it will return an array like `["t-shirt blue", "jeans black"]` for the available products.

## How to Use

1. **Upload the Template**: Upload this GTM template to your GTM container.
2. **Create a Variable**: Create a variable using this GTM template.
3. **Specify Your Array**: If not using the default `ecommerce.items` array (e.g., you’re using `eventModel.items`), specify the variable that contains the array for your products.
4. **Select the Key to Map**: Choose the key you want to map. For example, to retrieve all available item names, select `"item_name"`; to get product IDs, select `"item_id"`.
5. **Add the Variable to Your Tags**: Add this variable to your tags. For example, if you selected `"item_id"`, you can add this variable under the `content_ids` parameter in your Facebook tags.

## Creator

The Tag template was created by [Jorg van de Ven](https://www.linkedin.com/in/jorgvandeven/)

