# Sparsebundles

A Sparse Bundle Image will increase in size automatically but will not shrink automatically.

!!! note

    Before shrinking the sparse bundle, mount it and empty the trash to get rid of any deleted items from the image.

To compact the image, un-mount it and run:

``` console
$ hdiutil compact path/to/file.sparsebundle
```

To increase the image, un-mount it and run:

``` console
$ hdiutil resize -size [size] path/to/file.sparsebundle
```

## Resources

- [Resize a Sparse Bundle Image using Terminal](https://vidrih.net/2016/03/15/resize-a-sparse-bundle-image-using-terminal)
