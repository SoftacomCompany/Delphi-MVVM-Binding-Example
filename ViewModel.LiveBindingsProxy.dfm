object ViewModelLiveBindingsProxy: TViewModelLiveBindingsProxy
  Height = 215
  Width = 218
  object ViewModelDataGeneratorAdapter: TDataGeneratorAdapter
    FieldDefs = <
      item
        Name = 'ImageIndex'
        FieldType = ftInteger
        ReadOnly = False
      end
      item
        Name = 'ModelImageByIdx'
        FieldType = ftBitmap
        Generator = 'Bitmaps'
        ReadOnly = False
      end>
    Active = True
    AutoPost = True
    Options = [loptAllowInsert, loptAllowDelete, loptAllowModify]
    Left = 80
    Top = 128
  end
  object ViewModelDataBindSource: TAdapterBindSource
    AutoActivate = True
    OnCreateAdapter = ViewModelDataBindSourceCreateAdapter
    Adapter = ViewModelDataGeneratorAdapter
    ScopeMappings = <>
    Left = 80
    Top = 72
  end
end
