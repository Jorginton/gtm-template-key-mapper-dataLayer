___TERMS_OF_SERVICE___

By creating or modifying this file you agree to Google Tag Manager's Community
Template Gallery Developer Terms of Service available at
https://developers.google.com/tag-manager/gallery-tos (or such other URL as
Google may provide), as modified from time to time.


___INFO___

{
  "displayName": "Key Mapper | Ventastic Solutions",
  "categories": ["ADVERTISING", "REMARKETING", "ANALYTICS"],
  "type": "MACRO",
  "id": "cvt_temp_public_id",
  "version": 1,
  "securityGroups": [],
  "displayName": "Key Mapper | Ventastic Solutions",
  "description": "Maps specified keys from each object in an (e-commerce) array, allowing users to select and extract only the values they need into a new array.\n\nCreated by Jorg van de Ven | Ventastic Solution",
  "containerContexts": [
    "WEB"
  ]
}


___TEMPLATE_PARAMETERS___

[
  {
    "type": "RADIO",
    "name": "mapValues",
    "displayName": "Select data source",
    "radioItems": [
      {
        "value": "auto",
        "displayValue": "Automatically read from dataLayer"
      },
      {
        "value": "select",
        "displayValue": "Select e-commerce variable",
        "help": "Select a variable that contains the products or items array (e.g. ecommerce.detail.products or ecommerce.items)",
        "subParams": [
          {
            "type": "SELECT",
            "name": "manual",
            "displayName": "",
            "macrosInSelect": true,
            "selectItems": [],
            "simpleValueType": true
          }
        ]
      }
    ],
    "simpleValueType": true
  },
  {
    "type": "GROUP",
    "name": "mapGroup",
    "displayName": "Select key",
    "groupStyle": "NO_ZIPPY",
    "subParams": [
      {
        "type": "RADIO",
        "name": "key",
        "displayName": "Select a key to map the values",
        "radioItems": [
          {
            "value": "id",
            "displayValue": "Item ID"
          },
          {
            "value": "name",
            "displayValue": "Item Name"
          },
          {
            "value": "price",
            "displayValue": "Price",
            "subParams": [],
            "help": ""
          },
          {
            "value": "quantity",
            "displayValue": "Quantity"
          },
          {
            "value": "category",
            "displayValue": "Category"
          },
          {
            "value": "variant",
            "displayValue": "Variant"
          },
          {
            "value": "custom",
            "subParams": [
              {
                "type": "TEXT",
                "name": "customKey",
                "displayName": "",
                "simpleValueType": true,
                "notSetText": "Please enter a value or select another key to map."
              }
            ],
            "displayValue": "Custom",
            "help": "Enter a custom key that is not in the list above. For example, if \"\u003ci\u003eitem_sku\u003c/i\u003e\" is available in your items object, you can return it by entering \"\u003ci\u003eitem_sku\u003c/i\u003e\"."
          }
        ],
        "simpleValueType": true
      }
    ]
  }
]


___SANDBOXED_JS_FOR_WEB_TEMPLATE___

const log = require('logToConsole');
const copyFromDataLayer = require('copyFromDataLayer');

let ecommerce;

const customKey = data.customKey;
const selected = data.mapValues;
const key = data.key;

if (selected === 'auto') {
   ecommerce = copyFromDataLayer('ecommerce', 1) || {};
} else {
  ecommerce = data.manual;
}

// All UA ecommerce events
let events = ecommerce.impressions || ecommerce.productClick|| ecommerce.detail || ecommerce.add || ecommerce.remove || ecommerce.checkout || ecommerce.purchase || {};

// All 
let ecommerceArray = ecommerce.items || events.products || events || [];

if (!ecommerceArray || !ecommerceArray.length || ecommerceArray.length === 0) {
  return 'No products found';
}

const values = {
  id: ecommerceArray.map(obj => obj.id || obj.item_id),
  name: ecommerceArray.map(obj => obj.name || obj.item_name),
  price: ecommerceArray.map(obj => obj.price),
  brand: ecommerceArray.map(obj => obj.brand || obj.item_brand),
  quantity: ecommerceArray.map(obj => obj.quantity),
  category: ecommerceArray.map(obj => obj.category || obj.item_category),
  variant: ecommerceArray.map(obj => obj.variant || obj.item_variant),
  custom: ecommerceArray.map(obj => obj[customKey])
};

const result = values[key];
const logKey = customKey || key;

log("Returning value for key '" + logKey + "': " + result + ".");

return result !== undefined ? result : 'No keys available';


___WEB_PERMISSIONS___

[
  {
    "instance": {
      "key": {
        "publicId": "read_data_layer",
        "versionId": "1"
      },
      "param": [
        {
          "key": "allowedKeys",
          "value": {
            "type": 1,
            "string": "specific"
          }
        },
        {
          "key": "keyPatterns",
          "value": {
            "type": 2,
            "listItem": [
              {
                "type": 1,
                "string": "ecommerce"
              }
            ]
          }
        }
      ]
    },
    "clientAnnotations": {
      "isEditedByUser": true
    },
    "isRequired": true
  },
  {
    "instance": {
      "key": {
        "publicId": "logging",
        "versionId": "1"
      },
      "param": [
        {
          "key": "environments",
          "value": {
            "type": 1,
            "string": "debug"
          }
        }
      ]
    },
    "clientAnnotations": {
      "isEditedByUser": true
    },
    "isRequired": true
  }
]


___TESTS___

scenarios: []


___NOTES___

Created on 26-8-2022 15:44:10
