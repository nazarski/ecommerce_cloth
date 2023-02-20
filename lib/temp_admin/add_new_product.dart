import 'package:ecommerce_cloth/data/data_sources/remote/manage_products_data.dart';
import 'package:flutter/material.dart';

class AddNewProduct extends StatefulWidget {
  const AddNewProduct({Key? key}) : super(key: key);

  @override
  State<AddNewProduct> createState() => _AddNewProductState();
}

class _AddNewProductState extends State<AddNewProduct> {
  late final DateTime additionDate;
  final Set<String> attributes = {};
  final Map<String, int> availableQuantity = {};
  final GlobalKey<FormState> availabilityFormKey = GlobalKey();

  final TextEditingController brand = TextEditingController();

  final TextEditingController category = TextEditingController();
  final TextEditingController subcategory = TextEditingController();
  late final String id;
  final List<String> images = [];
  final TextEditingController image = TextEditingController();

  final TextEditingController name = TextEditingController();
  bool popular = false;
  final TextEditingController price = TextEditingController();
  late final Map<String, dynamic> rating;
  final TextEditingController saleTitle = TextEditingController();
  final TextEditingController saleValue = TextEditingController();

  final Map<String, dynamic> sale = {};
  bool addSale = false;

  void saveSizes() {
    if (availabilityFormKey.currentState!.validate()) {
      availabilityFormKey.currentState?.save();
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add new product"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            children: [
              GridView.count(
                shrinkWrap: true,
                crossAxisCount: 4,
                physics: const NeverScrollableScrollPhysics(),
                children: [
                  const Text('Men'),
                  Checkbox(
                      value: attributes.contains('men'),
                      onChanged: (checked) {
                        checked!
                            ? attributes.add('men')
                            : attributes.remove('men');
                        setState(() {});
                        print(attributes);
                      }),
                  const Text('Women'),
                  Checkbox(
                      value: attributes.contains('women'),
                      onChanged: (checked) {
                        checked!
                            ? attributes.add('women')
                            : attributes.remove('women');
                        setState(() {});
                      }),
                  const Text('Boys'),
                  Checkbox(
                      value: attributes.contains('boys'),
                      onChanged: (checked) {
                        checked!
                            ? attributes.add('boys')
                            : attributes.remove('boys');
                        setState(() {});
                      }),
                  const Text('Girls'),
                  Checkbox(
                      value: attributes.contains('girls'),
                      onChanged: (checked) {
                        checked!
                            ? attributes.add('girls')
                            : attributes.remove('girls');
                        setState(() {});
                      }),
                ],
              ),
              MyForm(
                availability: availableQuantity,
                formKey: availabilityFormKey,
              ),
              TextField(
                controller: brand,
                decoration: const InputDecoration(labelText: 'Brand'),
              ),
              TextField(
                controller: category,
                decoration: const InputDecoration(labelText: 'Category'),
              ),
              TextField(
                controller: subcategory,
                decoration: const InputDecoration(labelText: 'Subcategory'),
              ),
              Wrap(
                children: images
                    .map((e) =>
                    Image(
                      image: NetworkImage(
                        e,
                      ),
                      width: 100,
                      height: 100,
                    ))
                    .toList(),
              ),
              TextField(
                controller: image,
                decoration: const InputDecoration(labelText: 'Image path'),
              ),
              ElevatedButton(
                  onPressed: () {
                    setState(() {
                      images.add(image.text);
                      image.clear();
                    });
                  },
                  child: const Text('Add image')),
              TextField(
                controller: name,
                decoration: const InputDecoration(labelText: 'Product title'),
              ),
              Row(
                children: [
                  const Text('Popular'),
                  const SizedBox(
                    width: 12,
                  ),
                  Switch.adaptive(
                      value: popular,
                      onChanged: (value) {
                        setState(() {
                          popular = value;
                        });
                      }),
                ],
              ),
              TextField(
                controller: price,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(labelText: 'Product price'),
              ),
              Row(
                children: [
                  const Text('Sale'),
                  const SizedBox(
                    width: 12,
                  ),
                  Switch.adaptive(
                      value: addSale,
                      onChanged: (value) {
                        setState(() {
                          addSale = value;
                        });
                      }),
                ],
              ),
              if(addSale)...[
                Row(
                  children: [
                    Expanded(
                      child: TextField(
                        controller: saleTitle,
                        decoration:
                        const InputDecoration(labelText: 'Sale title'),
                      ),
                    ),
                    const SizedBox(
                      width: 12,
                    ),
                    Expanded(
                      child: TextField(
                        controller: saleValue,
                        decoration:
                        const InputDecoration(labelText: 'Discount value'),
                      ),
                    ),
                  ],
                )
              ],
              ElevatedButton(onPressed: () async {
                saveSizes();
                print(availableQuantity);
                await ManageProductsData.addNewProduct(
                    additionDate: DateTime.now(),
                    attributes: attributes.toList(),
                    availableQuantity: availableQuantity,
                    brand: brand.text,
                    category: category.text,
                    subcategory: subcategory.text,
                    id: name.text.toLowerCase().replaceAll(' ', '-'),
                    images: images,
                    name: name.text,
                    popular: popular,
                    price: int.parse(price.text),
                    rating: {},
                    sale: sale);
              },
                  child: Text('Add product'))
            ],
          ),
        ),
      ),
    );
  }
}

class MyForm extends StatefulWidget {
  const MyForm({Key? key, required this.availability, required this.formKey})
      : super(key: key);
  final Map<String, int> availability;
  final GlobalKey<FormState> formKey;

  @override
  State<MyForm> createState() => _MyFormState();
}

class _MyFormState extends State<MyForm> {
  final List fields = [0];

  @override
  Widget build(BuildContext context) {
    print(fields);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0),
      child: Form(
          key: widget.formKey,
          child: Column(
            children: [
              ...List.generate(fields.length, (index) {
                return TextFields(
                  onKey: (value) {
                    widget.availability.putIfAbsent(value, () => 0);
                  },
                  onValue: (quantity) {
                    widget.availability.update(widget.availability.keys.last,
                            (value) => value = int.parse(quantity));
                  },
                  index: fields[index],
                  last: fields[index] == fields.last,
                  addNew: () {
                    setState(() {
                      fields.add(fields[index] + 1);
                    });
                  },
                  removeCurrent: () {
                    setState(() {
                      fields.removeAt(index);
                    });
                  },
                );
              }),
            ],
          )),
    );
  }
}

class TextFields extends StatelessWidget {
  const TextFields({
    super.key,
    required this.onKey,
    required this.onValue,
    required this.index,
    required this.last,
    required this.addNew,
    required this.removeCurrent,
  });

  final int index;
  final ValueChanged onKey;
  final ValueChanged onValue;
  final bool last;
  final VoidCallback addNew;
  final VoidCallback removeCurrent;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Expanded(
            child: TextFormField(
              onSaved: onKey,
              decoration: const InputDecoration(labelText: 'Size'),
            )),
        const SizedBox(
          width: 8,
        ),
        Expanded(
            child: TextFormField(
              onSaved: onValue,
              decoration: const InputDecoration(labelText: 'Quantity'),
            )),
        last
            ? IconButton(onPressed: addNew, icon: const Icon(Icons.add))
            : IconButton(
            onPressed: removeCurrent, icon: const Icon(Icons.remove))
      ],
    );
  }
}
