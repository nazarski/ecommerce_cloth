import 'package:ecommerce_cloth/core/resources/app_colors.dart';
import 'package:ecommerce_cloth/core/resources/app_images.dart';
import 'package:ecommerce_cloth/presentation/pages/widgets/navigation/app_bar_back_search.dart';
import 'package:flutter/material.dart';


class MainSearchPage extends StatelessWidget {
  static const routeName = 'main-search-page';

  const MainSearchPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarSearchBack(
        title: 'Visual search',
        search: false,
        elevation: false,
        back: true,
        canPop: true,
        root: (){
          Navigator.of(context, rootNavigator: true).pop();
        },
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
              image: const AssetImage(AppImages.searchBackground),
              fit: BoxFit.cover,
              colorFilter: ColorFilter.mode(
                  Colors.black.withOpacity(0.3), BlendMode.softLight)),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              const Spacer(
                flex: 20,
              ),
              Text(
                'Search for an outfit by\ntaking a photo or uploading\nan image',
                textAlign: TextAlign.left,
                style: Theme.of(context)
                    .textTheme
                    .displayMedium
                    ?.copyWith(color: Colors.white, height: 1.3),
              ),
              const Spacer(flex: 1),
              SizedBox(
                height: 50,
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {},
                  child: const Text('TAKE A PHOTO'),
                ),
              ),
              const Spacer(flex: 1),
              SizedBox(
                height: 50,
                width: double.infinity,
                child: OutlinedButton(
                  style: const ButtonStyle(
                    foregroundColor:
                        MaterialStatePropertyAll(AppColorsLight.white),
                    side: MaterialStatePropertyAll(
                      BorderSide(
                        color: AppColorsLight.white,
                      ),
                    ),
                  ),
                  onPressed: () {},
                  child: const Text('UPLOAD AN IMAGE'),
                ),
              ),
              const Spacer(flex: 25),
            ],
          ),
        ),
      ),
    );
  }
}
