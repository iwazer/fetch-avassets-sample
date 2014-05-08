class PhotoListController < UITableViewController
  def viewDidLoad
    @photos = []

    enumration_block = ->(group, stop) {
      return unless group
      puts group.valueForProperty(ALAssetsGroupPropertyName)
      group.setAssetsFilter(ALAssetsFilter.allPhotos)

      group.enumerateAssetsUsingBlock(-> (alAsset, index, innerStop) {
                                        if alAsset
                                          image = UIImage.imageWithCGImage(alAsset.thumbnail)
                                          @photos << image
                                          tableView.reloadData
                                        end
                                      })
    }

    library = ALAssetsLibrary.alloc.init
    library.enumerateGroupsWithTypes(ALAssetsGroupAlbum|ALAssetsGroupSavedPhotos,
                                     usingBlock: enumration_block,
                                     failureBlock: ->(error) { puts "ERROR" })
  end

  def numberOfSectionsInTableView tableView
    1
  end

  def tableView tableView, numberOfRowsInSection: section
    @photos.count
  end

  def tableView tableView, cellForRowAtIndexPath: indexPath
    @@CellIdentifier = "Cell"
    cell = tableView.dequeueReusableCellWithIdentifier(@@CellIdentifier)
    unless cell
      cell = UITableViewCell.alloc.initWithStyle(UITableViewCellStyleValue1,
                                                 reuseIdentifier: @@CellIdentifier)
    end

    cell.imageView.image = @photos[indexPath.row]
    #cell.detailTextLabel.text = 

    cell
  end
end
