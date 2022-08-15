## 1.0.0

* Initial release.

## 1.0.1

* Minor changes.

## 1.0.2

* Minor changes on readme file, attached screenshots.

## 1.0.3

* Added a functionality to hide undo button on timer expire and added more documentation.

## 1.0.4

* Corrected and added more documentation.

## 1.0.5

* Now onselection method of SimplePollsWidget will return 2 objects as show below. This change was done because a loop was needed to get the selectd option now it just returns the options which registered a tap.
New:
onSelection: (PollFrameModel model, PollOptions selectedOptionModel) {
            print('Now total polls are : ' + model.totalPolls.toString());
            print('Selected option has label : ' + selectedOptionModel.label);
},

Old:
onSelection: (PollFrameModel model) {
        print('Now total polls are : ' + model.totalPolls.toString());
},

## 1.0.6

* Now user can set custom border shape of option and can pass a function onreset which will be called when poll is editable.

## 1.0.7

* Minor updates.