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
          }
        ],
        "simpleValueType": true
      }
    ]
  },
  {
    "type": "GROUP",
    "name": "CreatorGroup",
    "displayName": "Creator",
    "groupStyle": "ZIPPY_OPEN",
    "subParams": [
      {
        "type": "LABEL",
        "name": "CreatorLabel",
        "displayName": "Made by \u003cstrong\u003e\u003ca href\u003d\"https://www.linkedin.com/in/jorgvandeven/\"\u003eJorg van de Ven\u003c/a\u003e\u003c/strong\u003e | \u003cstrong\u003e\u003ca href\u003dhttps://www.jorgvandeven.nl/ventastic-solutions?utm_source\u003dgoogle\u0026utm_medium\u003dgtm\u0026utm_campaign\u003dgtm_template_key_mapper\u003eVentastic Solutions\u003c/a\u003e\u003c/strong\u003e"
      }
    ]
  }
]


___SANDBOXED_JS_FOR_WEB_TEMPLATE___

const copyFromDataLayer = require('copyFromDataLayer');
let ecommerce;

const selected = data.mapValues;

if (selected === 'auto') {
   ecommerce = copyFromDataLayer('ecommerce', 1) || {};
} else {
  ecommerce = data.manual;
}

// All UA ecommerce events
let events = ecommerce.impressions || ecommerce.productClick|| ecommerce.detail || ecommerce.add || ecommerce.remove || ecommerce.checkout || ecommerce.purchase || {};

// All 
let ecommerceArray = ecommerce.items || events.products || events || [];

let id = ecommerceArray.map(obj => {if (obj.id) {return obj.id;} else {return obj.item_id;}});
let name = ecommerceArray.map(obj => {if (obj.name) {return obj.name;} else {return obj.item_name;}});
let price = ecommerceArray.map(obj => (obj.price));
let brand = ecommerceArray.map(obj => {if (obj.brand) {return obj.brand;} else {return obj.item_brand;}});
let quantity = ecommerceArray.map(obj => (obj.quantity));
let category = ecommerceArray.map(obj => {if (obj.category) {return obj.category;} else {return obj.item_category;}});
let variant = ecommerceArray.map(obj => {if (obj.variant) {return obj.variant;} else {return obj.item_variant;}});
// let position

let key = data.key;

if (key === 'id') {
  return id;
} else if (key === 'name') {
  return name;
} else if (key === 'price') {
  return price;
} else if (key === 'brand') {
  return brand;
} else if (key === 'quantity') {
  return quantity;
} else if (key === 'category') {
  return category;
} else if (key === 'variant') {
  return variant;
} else {
  return 'Not available';
}


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
  }
]


___TESTS___

scenarios: []


___NOTES___

Created on 26-8-2022 15:44:10


