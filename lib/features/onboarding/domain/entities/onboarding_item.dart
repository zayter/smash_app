class OnboardingItem {
  String image;
  String description;

  OnboardingItem({required this.image, required this.description});
}

List<OnboardingItem> onboardingItems = [
  OnboardingItem(
      image: 'assets/images/onboarding_item_1.png',
      description: "Access our Extented Catalog"),
  OnboardingItem(
      image: 'assets/images/onboarding_item_2.png',
      description: "Filter Universes"),
  OnboardingItem(
      image: 'assets/images/onboarding_item_3.png', description: "And More..."),
];
