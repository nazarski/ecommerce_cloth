'use strict';

/**
 * shopping-cart service
 */

const { createCoreService } = require('@strapi/strapi').factories;

module.exports = createCoreService('api::shopping-cart.shopping-cart');
