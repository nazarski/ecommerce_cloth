module.exports = {
  beforeCreate(event) {
    const { data, where, select, populate } = event.params;
    event.params.data.price = 15;
    event.params.data.additionDate = Date.now();
  },

  afterCreate(event) {
    const { result, params } = event;

  },
};