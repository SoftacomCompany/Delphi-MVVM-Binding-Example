object ModelLiveBindingsProxy: TModelLiveBindingsProxy
  Height = 178
  Width = 187
  object ModelDataGeneratorAdapter: TDataGeneratorAdapter
    FieldDefs = <
      item
        Name = 'ModelDataCount'
        FieldType = ftInteger
        Generator = 'Integers'
        ReadOnly = False
      end>
    Active = True
    AutoPost = True
    RecordCount = 1
    Options = [loptAllowInsert, loptAllowDelete, loptAllowModify]
    Left = 72
    Top = 40
  end
  object ModelDataBindSource: TAdapterBindSource
    AutoActivate = True
    OnCreateAdapter = ModelAdapterBindSourceCreateAdapter
    Adapter = ModelDataGeneratorAdapter
    ScopeMappings = <>
    Left = 72
    Top = 96
  end
end
