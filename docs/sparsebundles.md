# Sparsebundles

A Sparse Bundle Image will increase in size automatically but will not shrink automatically. Before shrinking the sparse bundle, mount it and empty the trash to get rid of any deleted items from the image.

Unmount the image and follow the commands below.

To compact (image size stays the same):

```
hdiutil compact ~/Documents/filename.sparsebundle
hdiutil compact -help (for a list of options)
```

To increase the image size (eg., 20G to 30G)

```
hdiutil resize -size 30g ~/Documents/filename.sparsebundle
hdiutil resize -help (for a list of options)
```

Mount the image then do a Get Info on the Volume to see the new size.

# Resources

+ https://vidrih.net/2016/03/15/resize-a-sparse-bundle-image-using-terminal/