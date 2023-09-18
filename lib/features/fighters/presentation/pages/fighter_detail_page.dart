import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:smash_fighters_reloaded/core/themes/app_theme.dart';
import 'package:smash_fighters_reloaded/features/fighters/domain/entities/fighter.dart';

@RoutePage()
class FighterDetailPage extends StatelessWidget {
  final Fighter fighter;
  final String id;

  const FighterDetailPage({
    Key? key,
    @PathParam('id') required this.id,
    required this.fighter,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData(
            color: kColorScheme.background, //change your color here
          ),
          backgroundColor: kColorScheme.primary,
        ),
        body: SafeArea(
          child: Column(
            children: [
              Container(
                alignment: Alignment.topLeft,
                color: kColorScheme.primary,
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                ),
                child: Padding(
                  padding: const EdgeInsets.all(4),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        fighter.name,
                        style: Theme.of(context).textTheme.titleLarge!.copyWith(
                              color: kColorScheme.background,
                              fontWeight: FontWeight.w400,
                            ),
                      ),
                      Text(
                        fighter.universe,
                        style:
                            Theme.of(context).textTheme.titleMedium!.copyWith(
                                  color: kColorScheme.tertiary,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w400,
                                ),
                      ),
                    ],
                  ),
                ),
              ),
              Stack(
                children: [
                  Align(
                    alignment: Alignment.topLeft,
                    child: ClipPath(
                      clipper: DiagonalPathClipperTwo(),
                      child: Container(
                        height: 180,
                        color: kColorScheme.primary,
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 16, vertical: 8),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                alignment: Alignment.topLeft,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 4),
                                      child: Text(
                                          '${fighter.downloadsFormatted} downloads',
                                          style: Theme.of(context)
                                              .textTheme
                                              .titleMedium!
                                              .copyWith(
                                                color: kColorScheme.background,
                                                fontSize: 16,
                                                fontWeight: FontWeight.w400,
                                              )),
                                    ),
                                    const SizedBox(
                                      height: 8,
                                    ),
                                    RatingBar(
                                      itemSize: 16,
                                      itemPadding: const EdgeInsets.symmetric(
                                        horizontal: 4.0,
                                      ),
                                      initialRating: fighter.rateToDouble,
                                      minRating: fighter.rateToDouble,
                                      maxRating: fighter.rateToDouble,
                                      ignoreGestures: true,
                                      allowHalfRating: false,
                                      direction: Axis.horizontal,
                                      itemCount: 5,
                                      ratingWidget: RatingWidget(
                                        full: Image.asset(
                                          'assets/images/full_star.png',
                                        ),
                                        half: Image.asset(
                                          'assets/images/empty_star.png',
                                        ),
                                        empty: Image.asset(
                                          'assets/images/empty_star.png',
                                        ),
                                      ),
                                      onRatingUpdate: (rating) {},
                                    ),
                                    const SizedBox(
                                      height: 16,
                                    ),
                                    Row(
                                      children: [
                                        Expanded(
                                          flex: 40,
                                          child: Card(
                                            child: Container(
                                              alignment: Alignment.center,
                                              padding: const EdgeInsets.all(8),
                                              child: Text(
                                                '\$${fighter.price.toString()}',
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .titleMedium!
                                                    .copyWith(
                                                      color:
                                                          kColorScheme.primary,
                                                      fontSize: 22,
                                                    ),
                                              ),
                                            ),
                                          ),
                                        ),
                                        Expanded(
                                          flex: 60,
                                          child: Container(),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.topRight,
                    child: Image.asset(
                      'assets/images/zelda.png',
                    ),
                  ),
                ],
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: SingleChildScrollView(
                    child: Text(
                      fighter.description,
                      style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                            height: 2,
                            fontWeight: FontWeight.w400,
                          ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
