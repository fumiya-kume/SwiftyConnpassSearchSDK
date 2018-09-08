# What's SwiftyConnpassSearchSDK

This Library is WEB API Wrapper for Connpass.com

# How to Use/ Installation

## Carthage

You can install from Carthage

Add This to **Cartfile**

```
github fumiya-kume/SwiftyConnpassSearchSDK ~> 0.0.1
```

```
$ carthage update
```

## Demo

This Repository contan Demo Project.


# Construction

## Sample Code

``` Swift
       let searchOption = ConnpassSearchOption()
        searchOption.keyword = ["Ruby"]
        searchOption.count = 30
        
        self.connpassSearch.Search(searchOption: searchOption){ response in
            if let events = (response.Data?.events){
                self.events = events
            }
            
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
```

# future

- event page thumbnail
- event organizer infomation
- event organizer thumbnail
- and more infomation...
