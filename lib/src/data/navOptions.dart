

class NavCategory {
  final String category;

  NavCategory(this.category);
}

class NavOption {
  final String name;
  final String route;
  final NavCategory navCategory;

  NavOption(this.name, this.route, this.navCategory);
}

final navCategories = <NavCategory>[
  NavCategory('portfolio'),
  NavCategory('add'),
  NavCategory('account'),
];


final navOptions = <NavOption>[
  NavOption(
    'View Holdings (Stocks)',
    'portfolio/holdings/stocks',
    navCategories[0],
  ),
  NavOption(
    'View Holdings (Mutual Funds)',
    'portfolio/holdings/stocks',
    navCategories[0],
  ),
  NavOption(
    'View Holdings (Bonds)',
    'portfolio/holdings/stocks',
    navCategories[0],
  ),
  NavOption(
    'View Holdings (Fixed Deposits)',
    'portfolio/holdings/stocks',
    navCategories[0],
  ),
  NavOption(
    'View Stock Hodlings',
    'portfolio/holdings-aggregates/stocks',
    navCategories[0],
  ),
  NavOption(
    'View Mutual Fund Hodlings',
    'portfolio/holdings-aggregates/mutual-funds',
    navCategories[0],
  ),
  NavOption(
    'View Bond Hodlings',
    'portfolio/holdings-aggregates/snapshot',
    navCategories[0],
  ),
  NavOption(
    'Add to Watchlist', 
    'add/watchlist/',
    navCategories[1],),
  NavOption(
    'Add Stock Trade', 
    'add/trades/stock/',
    navCategories[1],),
  NavOption(
    'Add Mutual Fund Trade', 
    'add/trades/mutual-fund/',
    navCategories[1],),

    NavOption(
    'Add Bond Trade',
    'add/trades/bond/',
    navCategories[1],),
  NavOption(
    'demat',
    'account/demat/',
    navCategories[2],)
];

final portfolioNavOptions = navOptions.where((navOption) => navOption.navCategory == navCategories[0]).toList();
final addNavOptions = navOptions.where((navOption) => navOption.navCategory == navCategories[1]).toList();
final accountNavOptions = navOptions.where((navOption) => navOption.navCategory == navCategories[2]).toList();
