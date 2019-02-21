package com.community.model.base;

import com.community.model.base.HOpCodeUCenter;
import com.community.protobuf.UCErrorProto.UCError;
import com.community.protobuf.UCErrorProto.UCErrorCode;

public class UCErrorPack {
	public static UCError create(UCErrorCode ucErrorCode, String errorHOpCode) {
		UCError.Builder errorBuilder = UCError.newBuilder();
		errorBuilder.setHOpCode(HOpCodeUCenter.UC_ERROR);
		errorBuilder.setErrorCode(ucErrorCode);
		errorBuilder.setErrorHOpCode(errorHOpCode);
		return errorBuilder.build();
	}
}
