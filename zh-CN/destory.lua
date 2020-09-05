if pg and pg.ConnectionMgr then
	pg.ConnectionMgr.GetInstance():Disconnect()
end
