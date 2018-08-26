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
       self.connpassSearch.Search(keyword: "Ruby"){ response in
            if let events = (response.Data?.events){
                self.events = events
            }
            
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
```
