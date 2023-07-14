import 'package:dropdown_textfield/dropdown_textfield.dart';

List<DropDownValueModel> titles = [
  const DropDownValueModel(name: 'Mr', value: "Mr"),
  const DropDownValueModel(name: 'Mrs', value: "Mrs"),
];

List<DropDownValueModel> channels = [
  const DropDownValueModel(name: 'On trade', value: "On trade"),
  const DropDownValueModel(name: 'Off trade', value: "Off trade"),
];

List<DropDownValueModel> yesOrNo = [
  const DropDownValueModel(name: 'Yes', value: true),
  const DropDownValueModel(name: 'No', value: false),
];

final List<String> nigerianStates = [
  'Abia',
  'Adamawa',
  'Akwa Ibom',
  'Anambra',
  'Bauchi',
  'Bayelsa',
  'Benue',
  'Borno',
  'Cross River',
  'Delta',
  'Ebonyi',
  'Edo',
  'Ekiti',
  'Enugu',
  'FCT (Federal Capital Territory)',
  'Gombe',
  'Imo',
  'Jigawa',
  'Kaduna',
  'Kano',
  'Katsina',
  'Kebbi',
  'Kogi',
  'Kwara',
  'Lagos',
  'Nasarawa',
  'Niger',
  'Ogun',
  'Ondo',
  'Osun',
  'Oyo',
  'Plateau',
  'Rivers',
  'Sokoto',
  'Taraba',
  'Yobe',
  'Zamfara',
];

List<DropDownValueModel> states() {
  final states =
      nigerianStates.map((e) => DropDownValueModel(name: e, value: e));
  return states.toList();
}

List<String> majorCities = [
  'Lagos',
  'Abuja',
  'Kano',
  'Ibadan',
  'Kaduna',
  'Port Harcourt',
  'Benin City',
  'Maiduguri',
  'Zaria',
  'Aba',
  'Jos',
  'Ilorin',
  'Enugu',
  'Oyo',
  'Abeokuta',
  'Onitsha',
  'Warri',
  'Sokoto',
  'Calabar',
  'Uyo',
  'Katsina',
  'Akure',
  'Bauchi',
  'Osogbo',
  'Nnewi',
  'Minna',
  'Makurdi',
  'Ile-Ife',
  'Owerri',
  'Lokoja',
  'Ijebu-Ode',
  'Umuahia',
  'Ogbomosho',
  'Ado-Ekiti',
  'Asaba',
  'Awka',
  'Offa',
  'Keffi',
  'Okene',
  'Gusau',
  'Ede',
  'Mubi',
  'Ondo',
  'Damaturu',
  'Ikare',
  'Gombe',
  'Iwo',
  'Jimeta',
  'Ikot Ekpene',
  'Ekpoma',
  'Abeokuta',
  'Umuahia',
  'Lafia',
  'Nsukka',
  'Sapele',
  'Igboho',
  'Bida',
  'Ijebu-Igbo',
  'Gboko',
  'Kontagora',
  'Kabba',
  'Ejigbo',
  'Ilesa',
  'Ilobu',
  'Buguma',
  'Keffi',
  'Bonny',
  'Ijebu-Mushin',
  'Ipoti',
  'Wukari',
  'Nkpor',
  'Ohafia',
  'Ikirun',
  'Lere',
  'Wamba',
  'Argungu',
  'Geidam',
  'Egbe',
  'Auchi',
  'Idanre',
  'Bama',
  'Ganye',
  'Afikpo',
  'Okrika',
  'Zungeru',
  'Bende',
  'Ugep',
  'Ubiaja',
  'Ehor',
  'Okigwe',
  'Orerokpe',
  'Idah',
  'Deba',
  'Ijebu-Imushin',
  'Otukpo',
  'Asaba',
  'Apomu',
  'Umuahia',
  'Obudu',
  'Wudil',
  'Birnin Kebbi',
  'Badagry',
  'Igboho',
  'Ogaminana',
  'Iperu',
  'Ode',
  'Olupona',
  'Enugu-Ezike',
  'Ogoja',
  'Kuje',
  'Fiditi',
  'Ikom',
  'Isara',
  'Ughelli',
  'Uromi',
  // Add more cities here...
];

List<DropDownValueModel> cities() {
  final cities = majorCities.map((e) => DropDownValueModel(name: e, value: e));
  return cities.toList();
}

List<DropDownValueModel> regions() {
  final regions =
      geopoliticalRegions.map((e) => DropDownValueModel(name: e, value: e));
  return regions.toList();
}

List<String> geopoliticalRegions = [
  'North Central',
  'North East',
  'North West',
  'South East',
  'South South',
  'South West',
];

List<String> offTradeCategoriesList = [
  'Modern trade',
  'Specialised wine shop',
  'Social event vendor',
  'Wholesaler',
  'E-retail',
];

List<String> subChannelsList = [
  'Supermarket',
  'Modern trade',
  'Specialised wine shop',
  'E-retail',
  'Wholesalers',
  'Social event vendor',
  'Night club',
  'Bar / Lounge',
  'Restaurant',
  'Restaurant / Lounge',
  'Hotel',
  'Café',
];

List<DropDownValueModel> subChannels() {
  final subChannels =
      subChannelsList.map((e) => DropDownValueModel(name: e, value: e));
  return subChannels.toList();
}

List<DropDownValueModel> offTradeCategories() {
  final offTradeCategories =
      offTradeCategoriesList.map((e) => DropDownValueModel(name: e, value: e));
  return offTradeCategories.toList();
}

List<Map<String, dynamic>> productList = [
  {
    'Brand': 'Gerard Bertrand',
    'Sku': '6 Sens',
    'Category': 'WINES',
    'Channel': 'On-trade & off-trade',
  },
  {
    'Brand': 'Gerard Bertrand',
    'Sku': 'Art De Vivre',
    'Category': 'WINES',
    'Channel': 'On-trade & off-trade',
  },
  {
    'Brand': 'Gerard Bertrand',
    'Sku': 'Cote Des Roses',
    'Category': 'WINES',
    'Channel': 'On-trade & off-trade',
  },
  {
    'Brand': 'Gerard Bertrand',
    'Sku': 'Cigalus',
    'Category': 'WINES',
    'Channel': 'On-trade & off-trade',
  },
  {
    'Brand': 'Van Loveren',
    'Sku': 'Beacon Hill',
    'Category': 'WINES',
    'Channel': 'On-trade & off-trade',
  },
  {
    'Brand': 'Van Loveren',
    'Sku': 'Papillon',
    'Category': 'WINES',
    'Channel': 'On-trade & off-trade',
  },
  {
    'Brand': 'Proximo',
    'Sku': 'Bushmills',
    'Category': 'SPIRITS',
    'Channel': 'On-trade & off-trade',
  },
  {
    'Brand': 'Les Bienheureux',
    'Sku': 'Embargo',
    'Category': 'SPIRITS',
    'Channel': 'On-trade & off-trade',
  },
  {
    'Brand': 'BPHR',
    'Sku': 'Escudo Rojo Gran Reserva',
    'Category': 'WINES',
    'Channel': 'On-trade & off-trade',
  },
  {
    'Brand': 'BPHR',
    'Sku': 'Escudo Rojo Reserva',
    'Category': 'WINES',
    'Channel': 'On-trade & off-trade',
  },
  {
    'Brand': 'Georges Duboeuf',
    'Sku': 'Georges Duboeuf',
    'Category': 'WINES',
    'Channel': 'On-trade & off-trade',
  },
  {
    'Brand': 'Haussmann',
    'Sku': 'Haussmann',
    'Category': 'WINES',
    'Channel': 'On-trade & off-trade',
  },
  {
    'Brand': 'Netter',
    'Sku': 'J Grandet',
    'Category': 'WINES',
    'Channel': 'On-trade & off-trade',
  },
  {
    'Brand': 'Proximo',
    'Sku': 'Jose Cuervo',
    'Category': 'SPIRITS',
    'Channel': 'On-trade & off-trade',
  },
  {
    'Brand': 'Brotte',
    'Sku': 'La fiole Chateauneuf du pape',
    'Category': 'WINES',
    'Channel': 'On-trade & off-trade',
  },
  {
    'Brand': 'Brotte',
    'Sku': 'La fiole Cote du rhone',
    'Category': 'WINES',
    'Channel': 'On-trade & off-trade',
  },
  {
    'Brand': 'BPHR',
    'Sku': 'Mouton Cadet Bordeaux Red',
    'Category': 'WINES',
    'Channel': 'On-trade & off-trade',
  },
  {
    'Brand': 'BPHR',
    'Sku': 'Mouton Cadet Sauvignon Blanc',
    'Category': 'WINES',
    'Channel': 'On-trade & off-trade',
  },
  {
    'Brand': 'BPHR',
    'Sku': 'Reserve Mouton Cadet',
    'Category': 'WINES',
    'Channel': 'On-trade & off-trade',
  },
  {
    'Brand': 'Netter',
    'Sku': 'Pierre Grandet',
    'Category': 'WINES',
    'Channel': 'On-trade & off-trade',
  },
  {
    'Brand': 'Nutresa',
    'Sku': 'Super 2',
    'Category': 'FOOD',
    'Channel': 'Off-trade',
  },
  {
    'Brand': 'Moet Hennessy',
    'Sku': 'Hennessy VS',
    'Category': 'SPIRITS',
    'Channel': 'On-trade & off-trade',
  },
  {
    'Brand': 'Moet Hennessy',
    'Sku': 'Hennessy VSOP',
    'Category': 'SPIRITS',
    'Channel': 'On-trade & off-trade',
  },
  {
    'Brand': 'Moet Hennessy',
    'Sku': 'Hennessy XO',
    'Category': 'SPIRITS',
    'Channel': 'On-trade & off-trade',
  },
  {
    'Brand': 'Moet Hennessy',
    'Sku': 'Moet brut',
    'Category': 'WINES',
    'Channel': 'On-trade & off-trade',
  },
  {
    'Brand': 'Moet Hennessy',
    'Sku': 'Moet Nectar Imp Rosé',
    'Category': 'WINES',
    'Channel': 'On-trade & off-trade',
  },
  {
    'Brand': 'Moet Hennessy',
    'Sku': 'Dom Perignon',
    'Category': 'WINES',
    'Channel': 'On-trade & off-trade',
  },
  {
    'Brand': 'Moet Hennessy',
    'Sku': 'Veuve Clicquot',
    'Category': 'WINES',
    'Channel': 'On-trade & off-trade',
  }
];

List<String> brandsList = [
  'Gerard Bertrand',
  'Van Loveren',
  'Proximo',
  'Les Bienheureux',
  'BPHR',
  'Georges Duboeuf',
  'Haussmann',
  'Netter',
  'Brotte',
  'Nutresa',
  'Moet Hennessy',
];

List<DropDownValueModel> brandsDropdownList() {
  final brands = brandsList.map((e) => DropDownValueModel(name: e, value: e));
  return brands.toList();
}

List<String> sku = [
  '6 Sens',
  'Art De Vivre',
  'Cote Des Roses',
  'Cigalus',
  'Beacon Hill',
  'Papillon',
  'Bushmills',
  'Embargo',
  'Escudo Rojo Gran Reserva',
  'Escudo Rojo Reserva',
  'Georges Duboeuf',
  'Haussmann',
  'J Grandet',
  'Jose Cuervo',
  'La fiole Chateauneuf du pape',
  'La fiole Cote du rhone',
  'Mouton Cadet Bordeaux Red',
  'Mouton Cadet Sauvignon Blanc',
  'Reserve Mouton Cadet',
  'Pierre Grandet',
  'Super 2',
  'Hennessy VS',
  'Hennessy VSOP',
  'Hennessy XO',
  'Moet brut',
  'Moet Nectar Imp Rosé',
  'Dom Perignon',
  'Veuve Clicquot',
];

List<DropDownValueModel> skus() {
  final skus = sku.map((e) => DropDownValueModel(name: e, value: e));
  return skus.toList();
}

final List<String> drinkCategory = ["WINES", "SPIRITS", "FOOD"];

List<DropDownValueModel> drinkCategories() {
  final drinkCategories =
      drinkCategory.map((e) => DropDownValueModel(name: e, value: e));
  return drinkCategories.toList();
}

List<String> wines = [
  '6 Sens',
  'Art De Vivre',
  'Cote Des Roses',
  'Cigalus',
  'Beacon Hill',
  'Papillon',
  'Escudo Rojo Gran Reserva',
  'Escudo Rojo Reserva',
  'Georges Duboeuf',
  'Haussmann',
  'J Grandet',
  'La fiole Chateauneuf du pape',
  'La fiole Cote du rhone',
  'Mouton Cadet Bordeaux Red',
  'Mouton Cadet Sauvignon Blanc',
  'Reserve Mouton Cadet',
  'Pierre Grandet',
  'Moet brut',
  'Moet Nectar Imp Rosé',
  'Dom Perignon',
  'Veuve Clicquot',
];

List<String> spirits = [
  'Bushmills',
  'Embargo',
  'Jose Cuervo',
  'Hennessy VS',
  'Hennessy VSOP',
  'Hennessy XO',
];

List<String> foods = ["Super 2"];

getCategory(String product) {
  if (wines.contains(product)) {
    return "WINES";
  } else if (spirits.contains(product)) {
    return "SPIRITS";
  } else if (foods.contains(product)) {
    return "FOOD";
  } else {
    return "";
  }
}

getChannel(String product) {
  if (product == "Super 2") {
    return "Off-trade";
  } else if (product != "Super 2") {
    return "On-trade & off-trade";
  } else {
    return "";
  }
}
