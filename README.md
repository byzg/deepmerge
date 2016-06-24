# deepmerge
This is fork of deepmerge library at the [state](https://github.com/KyleAMathews/deepmerge/tree/49cc4edcaba6749951d7f06f269e594d7bcafa22)

Orignal repository: https://github.com/KyleAMathews/deepmerge
# Fork meaning
during two arrays of objects is megring it should not merge different objects in target array
Example:
```javasript
var foo = {a: {aa: [{aaa: 1, aab: 2}]}};
var bar = {a: {aa: [{aaa: 3, bbb: 5}]}};
deepmerge(foo, bar);
```
in original version output:
```javascript
{a: {aa: [{aaa: 3, aab: 2, bbb: 5}]}};
```
in fork (this) version output:
```javascript
{a: {aa: [{aaa: 1, aab: 2}, {aaa: 3, bbb: 5}]}};
```
