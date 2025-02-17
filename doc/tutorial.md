# tutorials

## build new application from template

### set the newapp name
```
export newapp=newapp
```

### set the prefered editor

```
export EDITOR=nano
```

# duplicate the template

```
cp ./lib/template ./lib/${newapp}
```

## edit the template to fit your need 
### help message
```
$EDITOR  ./lib/${newapp}/01-info.sh
```
### modify the functions or place you own file
functions from template
```
$EDITOR ./lib/${newapp}/10-functions.sh
```
place new file
```
#EDITOR ./lib/${newapp}/15-new.sh
```
### modify the action list
```
$EDITOR ./lib/${newapp}/90-action.sh
```
### modify the default action
```
$EDITOR ./lib/${newapp}/95-default_action.sh
```

### modify the main function
```
$EDITOR ./lib/${newapp}/99-main.sh
```
