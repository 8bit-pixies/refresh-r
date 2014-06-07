Some Unrelated SAS Stuff
========================

##### How do I save data?

You may use the `save.image` function to create an image of your current sesion.
This will save your whole workspace. Alternatively, if you just want to save a
single object, you can use the `save` function. To load it again, use the `load`
function.

##### How do I unload a package?

`detach("package:PACKAGE_NAME", unload=TRUE)`
