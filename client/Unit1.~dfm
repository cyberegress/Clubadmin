object svcg: Tsvcg
  OldCreateOrder = False
  AllowStop = False
  AllowPause = False
  DisplayName = 'svcg'
  ErrorSeverity = esIgnore
  Interactive = True
  BeforeUninstall = ServiceBeforeUninstall
  OnStart = ServiceStart
  Left = 508
  Top = 276
  Height = 479
  Width = 741
  object s1: TClientSocket
    Active = False
    ClientType = ctNonBlocking
    Port = 83
    OnConnect = s1Connect
    OnDisconnect = s1Disconnect
    OnRead = s1Read
    OnError = s1Error
    Left = 8
    Top = 8
  end
  object ApplicationEvents1: TApplicationEvents
    OnException = ApplicationEvents1Exception
    OnMessage = ApplicationEvents1Message
    Left = 240
    Top = 64
  end
end
