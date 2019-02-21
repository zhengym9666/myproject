// Generated by the protocol buffer compiler.  DO NOT EDIT!
// source: UCErrorProto.proto

package com.community.protobuf;

public final class UCErrorProto {
  private UCErrorProto() {}
  public static void registerAllExtensions(
      com.google.protobuf.ExtensionRegistryLite registry) {
  }

  public static void registerAllExtensions(
      com.google.protobuf.ExtensionRegistry registry) {
    registerAllExtensions(
        (com.google.protobuf.ExtensionRegistryLite) registry);
  }
  /**
   * Protobuf enum {@code com.community.protobuf.UCErrorCode}
   */
  public enum UCErrorCode
      implements com.google.protobuf.ProtocolMessageEnum {
    /**
     * <pre>
     *未知错误
     * </pre>
     *
     * <code>ERROR_CODE_0 = 0;</code>
     */
    ERROR_CODE_0(0),
    /**
     * <pre>
     *该token已过期或不合法
     * </pre>
     *
     * <code>ERROR_CODE_1 = 1;</code>
     */
    ERROR_CODE_1(1),
    /**
     * <pre>
     *该请求token不许为空
     * </pre>
     *
     * <code>ERROR_CODE_2 = 2;</code>
     */
    ERROR_CODE_2(2),
    /**
     * <pre>
     *该电话号码已被注册，添加用户失败
     * </pre>
     *
     * <code>ERROR_CODE_3 = 3;</code>
     */
    ERROR_CODE_3(3),
    /**
     * <pre>
     *不存在这个用户
     * </pre>
     *
     * <code>ERROR_CODE_4 = 4;</code>
     */
    ERROR_CODE_4(4),
    /**
     * <pre>
     *该用户已冻结或删除
     * </pre>
     *
     * <code>ERROR_CODE_5 = 5;</code>
     */
    ERROR_CODE_5(5),
    /**
     * <pre>
     *密码错误
     * </pre>
     *
     * <code>ERROR_CODE_6 = 6;</code>
     */
    ERROR_CODE_6(6),
    /**
     * <pre>
     *创建token失败
     * </pre>
     *
     * <code>ERROR_CODE_7 = 7;</code>
     */
    ERROR_CODE_7(7),
    /**
     * <pre>
     *延长token过期时间失败
     * </pre>
     *
     * <code>ERROR_CODE_8 = 8;</code>
     */
    ERROR_CODE_8(8),
    /**
     * <pre>
     *删除token失败
     * </pre>
     *
     * <code>ERROR_CODE_9 = 9;</code>
     */
    ERROR_CODE_9(9),
    /**
     * <pre>
     *创建用户组失败
     * </pre>
     *
     * <code>ERROR_CODE_10 = 10;</code>
     */
    ERROR_CODE_10(10),
    /**
     * <pre>
     *修改用户组失败
     * </pre>
     *
     * <code>ERROR_CODE_11 = 11;</code>
     */
    ERROR_CODE_11(11),
    /**
     * <pre>
     *获取用户组失败
     * </pre>
     *
     * <code>ERROR_CODE_12 = 12;</code>
     */
    ERROR_CODE_12(12),
    /**
     * <pre>
     *创建用户失败
     * </pre>
     *
     * <code>ERROR_CODE_13 = 13;</code>
     */
    ERROR_CODE_13(13),
    /**
     * <pre>
     *修改用户失败
     * </pre>
     *
     * <code>ERROR_CODE_14 = 14;</code>
     */
    ERROR_CODE_14(14),
    /**
     * <pre>
     *删除用户组失败
     * </pre>
     *
     * <code>ERROR_CODE_15 = 15;</code>
     */
    ERROR_CODE_15(15),
    /**
     * <pre>
     *获取admintoken失败
     * </pre>
     *
     * <code>ERROR_CODE_16 = 16;</code>
     */
    ERROR_CODE_16(16),
    /**
     * <pre>
     *你没有权限
     * </pre>
     *
     * <code>ERROR_CODE_17 = 17;</code>
     */
    ERROR_CODE_17(17),
    UNRECOGNIZED(-1),
    ;

    /**
     * <pre>
     *未知错误
     * </pre>
     *
     * <code>ERROR_CODE_0 = 0;</code>
     */
    public static final int ERROR_CODE_0_VALUE = 0;
    /**
     * <pre>
     *该token已过期或不合法
     * </pre>
     *
     * <code>ERROR_CODE_1 = 1;</code>
     */
    public static final int ERROR_CODE_1_VALUE = 1;
    /**
     * <pre>
     *该请求token不许为空
     * </pre>
     *
     * <code>ERROR_CODE_2 = 2;</code>
     */
    public static final int ERROR_CODE_2_VALUE = 2;
    /**
     * <pre>
     *该电话号码已被注册，添加用户失败
     * </pre>
     *
     * <code>ERROR_CODE_3 = 3;</code>
     */
    public static final int ERROR_CODE_3_VALUE = 3;
    /**
     * <pre>
     *不存在这个用户
     * </pre>
     *
     * <code>ERROR_CODE_4 = 4;</code>
     */
    public static final int ERROR_CODE_4_VALUE = 4;
    /**
     * <pre>
     *该用户已冻结或删除
     * </pre>
     *
     * <code>ERROR_CODE_5 = 5;</code>
     */
    public static final int ERROR_CODE_5_VALUE = 5;
    /**
     * <pre>
     *密码错误
     * </pre>
     *
     * <code>ERROR_CODE_6 = 6;</code>
     */
    public static final int ERROR_CODE_6_VALUE = 6;
    /**
     * <pre>
     *创建token失败
     * </pre>
     *
     * <code>ERROR_CODE_7 = 7;</code>
     */
    public static final int ERROR_CODE_7_VALUE = 7;
    /**
     * <pre>
     *延长token过期时间失败
     * </pre>
     *
     * <code>ERROR_CODE_8 = 8;</code>
     */
    public static final int ERROR_CODE_8_VALUE = 8;
    /**
     * <pre>
     *删除token失败
     * </pre>
     *
     * <code>ERROR_CODE_9 = 9;</code>
     */
    public static final int ERROR_CODE_9_VALUE = 9;
    /**
     * <pre>
     *创建用户组失败
     * </pre>
     *
     * <code>ERROR_CODE_10 = 10;</code>
     */
    public static final int ERROR_CODE_10_VALUE = 10;
    /**
     * <pre>
     *修改用户组失败
     * </pre>
     *
     * <code>ERROR_CODE_11 = 11;</code>
     */
    public static final int ERROR_CODE_11_VALUE = 11;
    /**
     * <pre>
     *获取用户组失败
     * </pre>
     *
     * <code>ERROR_CODE_12 = 12;</code>
     */
    public static final int ERROR_CODE_12_VALUE = 12;
    /**
     * <pre>
     *创建用户失败
     * </pre>
     *
     * <code>ERROR_CODE_13 = 13;</code>
     */
    public static final int ERROR_CODE_13_VALUE = 13;
    /**
     * <pre>
     *修改用户失败
     * </pre>
     *
     * <code>ERROR_CODE_14 = 14;</code>
     */
    public static final int ERROR_CODE_14_VALUE = 14;
    /**
     * <pre>
     *删除用户组失败
     * </pre>
     *
     * <code>ERROR_CODE_15 = 15;</code>
     */
    public static final int ERROR_CODE_15_VALUE = 15;
    /**
     * <pre>
     *获取admintoken失败
     * </pre>
     *
     * <code>ERROR_CODE_16 = 16;</code>
     */
    public static final int ERROR_CODE_16_VALUE = 16;
    /**
     * <pre>
     *你没有权限
     * </pre>
     *
     * <code>ERROR_CODE_17 = 17;</code>
     */
    public static final int ERROR_CODE_17_VALUE = 17;



    public final int getNumber() {
      if (this == UNRECOGNIZED) {
        throw new IllegalArgumentException(
            "Can't get the number of an unknown enum value.");
      }
      return value;
    }

    /**
     * @deprecated Use {@link #forNumber(int)} instead.
     */
    @Deprecated
    public static UCErrorCode valueOf(int value) {
      return forNumber(value);
    }

    public static UCErrorCode forNumber(int value) {
      switch (value) {
        case 0: return ERROR_CODE_0;
        case 1: return ERROR_CODE_1;
        case 2: return ERROR_CODE_2;
        case 3: return ERROR_CODE_3;
        case 4: return ERROR_CODE_4;
        case 5: return ERROR_CODE_5;
        case 6: return ERROR_CODE_6;
        case 7: return ERROR_CODE_7;
        case 8: return ERROR_CODE_8;
        case 9: return ERROR_CODE_9;
        case 10: return ERROR_CODE_10;
        case 11: return ERROR_CODE_11;
        case 12: return ERROR_CODE_12;
        case 13: return ERROR_CODE_13;
        case 14: return ERROR_CODE_14;
        case 15: return ERROR_CODE_15;
        case 16: return ERROR_CODE_16;
        case 17: return ERROR_CODE_17;
        default: return null;
      }
    }

    public static com.google.protobuf.Internal.EnumLiteMap<UCErrorCode>
        internalGetValueMap() {
      return internalValueMap;
    }
    private static final com.google.protobuf.Internal.EnumLiteMap<
        UCErrorCode> internalValueMap =
          new com.google.protobuf.Internal.EnumLiteMap<UCErrorCode>() {
            public UCErrorCode findValueByNumber(int number) {
              return UCErrorCode.forNumber(number);
            }
          };

    public final com.google.protobuf.Descriptors.EnumValueDescriptor
        getValueDescriptor() {
      return getDescriptor().getValues().get(ordinal());
    }
    public final com.google.protobuf.Descriptors.EnumDescriptor
        getDescriptorForType() {
      return getDescriptor();
    }
    public static final com.google.protobuf.Descriptors.EnumDescriptor
        getDescriptor() {
      return com.community.protobuf.UCErrorProto.getDescriptor().getEnumTypes().get(0);
    }

    private static final UCErrorCode[] VALUES = values();

    public static UCErrorCode valueOf(
        com.google.protobuf.Descriptors.EnumValueDescriptor desc) {
      if (desc.getType() != getDescriptor()) {
        throw new IllegalArgumentException(
          "EnumValueDescriptor is not for this type.");
      }
      if (desc.getIndex() == -1) {
        return UNRECOGNIZED;
      }
      return VALUES[desc.getIndex()];
    }

    private final int value;

    private UCErrorCode(int value) {
      this.value = value;
    }

    // @@protoc_insertion_point(enum_scope:com.community.protobuf.UCErrorCode)
  }

  public interface UCErrorOrBuilder extends
      // @@protoc_insertion_point(interface_extends:com.community.protobuf.UCError)
      com.google.protobuf.MessageOrBuilder {

    /**
     * <code>optional string hOpCode = 1;</code>
     */
    String getHOpCode();
    /**
     * <code>optional string hOpCode = 1;</code>
     */
    com.google.protobuf.ByteString
        getHOpCodeBytes();

    /**
     * <code>optional .com.community.protobuf.UCErrorCode errorCode = 2;</code>
     */
    int getErrorCodeValue();
    /**
     * <code>optional .com.community.protobuf.UCErrorCode errorCode = 2;</code>
     */
    com.community.protobuf.UCErrorProto.UCErrorCode getErrorCode();

    /**
     * <code>optional string errorHOpCode = 3;</code>
     */
    String getErrorHOpCode();
    /**
     * <code>optional string errorHOpCode = 3;</code>
     */
    com.google.protobuf.ByteString
        getErrorHOpCodeBytes();

    /**
     * <code>optional string extraMsg = 4;</code>
     */
    String getExtraMsg();
    /**
     * <code>optional string extraMsg = 4;</code>
     */
    com.google.protobuf.ByteString
        getExtraMsgBytes();
  }
  /**
   * Protobuf type {@code com.community.protobuf.UCError}
   */
  public  static final class UCError extends
      com.google.protobuf.GeneratedMessageV3 implements
      // @@protoc_insertion_point(message_implements:com.community.protobuf.UCError)
      UCErrorOrBuilder {
    // Use UCError.newBuilder() to construct.
    private UCError(com.google.protobuf.GeneratedMessageV3.Builder<?> builder) {
      super(builder);
    }
    private UCError() {
      hOpCode_ = "";
      errorCode_ = 0;
      errorHOpCode_ = "";
      extraMsg_ = "";
    }

    @Override
    public final com.google.protobuf.UnknownFieldSet
    getUnknownFields() {
      return com.google.protobuf.UnknownFieldSet.getDefaultInstance();
    }
    private UCError(
        com.google.protobuf.CodedInputStream input,
        com.google.protobuf.ExtensionRegistryLite extensionRegistry)
        throws com.google.protobuf.InvalidProtocolBufferException {
      this();
      int mutable_bitField0_ = 0;
      try {
        boolean done = false;
        while (!done) {
          int tag = input.readTag();
          switch (tag) {
            case 0:
              done = true;
              break;
            default: {
              if (!input.skipField(tag)) {
                done = true;
              }
              break;
            }
            case 10: {
              String s = input.readStringRequireUtf8();

              hOpCode_ = s;
              break;
            }
            case 16: {
              int rawValue = input.readEnum();

              errorCode_ = rawValue;
              break;
            }
            case 26: {
              String s = input.readStringRequireUtf8();

              errorHOpCode_ = s;
              break;
            }
            case 34: {
              String s = input.readStringRequireUtf8();

              extraMsg_ = s;
              break;
            }
          }
        }
      } catch (com.google.protobuf.InvalidProtocolBufferException e) {
        throw e.setUnfinishedMessage(this);
      } catch (java.io.IOException e) {
        throw new com.google.protobuf.InvalidProtocolBufferException(
            e).setUnfinishedMessage(this);
      } finally {
        makeExtensionsImmutable();
      }
    }
    public static final com.google.protobuf.Descriptors.Descriptor
        getDescriptor() {
      return com.community.protobuf.UCErrorProto.internal_static_org_startpoint_protobuf_http_UCError_descriptor;
    }

    protected FieldAccessorTable
        internalGetFieldAccessorTable() {
      return com.community.protobuf.UCErrorProto.internal_static_org_startpoint_protobuf_http_UCError_fieldAccessorTable
          .ensureFieldAccessorsInitialized(
              com.community.protobuf.UCErrorProto.UCError.class, com.community.protobuf.UCErrorProto.UCError.Builder.class);
    }

    public static final int HOPCODE_FIELD_NUMBER = 1;
    private volatile Object hOpCode_;
    /**
     * <code>optional string hOpCode = 1;</code>
     */
    public String getHOpCode() {
      Object ref = hOpCode_;
      if (ref instanceof String) {
        return (String) ref;
      } else {
        com.google.protobuf.ByteString bs = 
            (com.google.protobuf.ByteString) ref;
        String s = bs.toStringUtf8();
        hOpCode_ = s;
        return s;
      }
    }
    /**
     * <code>optional string hOpCode = 1;</code>
     */
    public com.google.protobuf.ByteString
        getHOpCodeBytes() {
      Object ref = hOpCode_;
      if (ref instanceof String) {
        com.google.protobuf.ByteString b = 
            com.google.protobuf.ByteString.copyFromUtf8(
                (String) ref);
        hOpCode_ = b;
        return b;
      } else {
        return (com.google.protobuf.ByteString) ref;
      }
    }

    public static final int ERRORCODE_FIELD_NUMBER = 2;
    private int errorCode_;
    /**
     * <code>optional .com.community.protobuf.UCErrorCode errorCode = 2;</code>
     */
    public int getErrorCodeValue() {
      return errorCode_;
    }
    /**
     * <code>optional .com.community.protobuf.UCErrorCode errorCode = 2;</code>
     */
    public com.community.protobuf.UCErrorProto.UCErrorCode getErrorCode() {
      com.community.protobuf.UCErrorProto.UCErrorCode result = com.community.protobuf.UCErrorProto.UCErrorCode.valueOf(errorCode_);
      return result == null ? com.community.protobuf.UCErrorProto.UCErrorCode.UNRECOGNIZED : result;
    }

    public static final int ERRORHOPCODE_FIELD_NUMBER = 3;
    private volatile Object errorHOpCode_;
    /**
     * <code>optional string errorHOpCode = 3;</code>
     */
    public String getErrorHOpCode() {
      Object ref = errorHOpCode_;
      if (ref instanceof String) {
        return (String) ref;
      } else {
        com.google.protobuf.ByteString bs = 
            (com.google.protobuf.ByteString) ref;
        String s = bs.toStringUtf8();
        errorHOpCode_ = s;
        return s;
      }
    }
    /**
     * <code>optional string errorHOpCode = 3;</code>
     */
    public com.google.protobuf.ByteString
        getErrorHOpCodeBytes() {
      Object ref = errorHOpCode_;
      if (ref instanceof String) {
        com.google.protobuf.ByteString b = 
            com.google.protobuf.ByteString.copyFromUtf8(
                (String) ref);
        errorHOpCode_ = b;
        return b;
      } else {
        return (com.google.protobuf.ByteString) ref;
      }
    }

    public static final int EXTRAMSG_FIELD_NUMBER = 4;
    private volatile Object extraMsg_;
    /**
     * <code>optional string extraMsg = 4;</code>
     */
    public String getExtraMsg() {
      Object ref = extraMsg_;
      if (ref instanceof String) {
        return (String) ref;
      } else {
        com.google.protobuf.ByteString bs = 
            (com.google.protobuf.ByteString) ref;
        String s = bs.toStringUtf8();
        extraMsg_ = s;
        return s;
      }
    }
    /**
     * <code>optional string extraMsg = 4;</code>
     */
    public com.google.protobuf.ByteString
        getExtraMsgBytes() {
      Object ref = extraMsg_;
      if (ref instanceof String) {
        com.google.protobuf.ByteString b = 
            com.google.protobuf.ByteString.copyFromUtf8(
                (String) ref);
        extraMsg_ = b;
        return b;
      } else {
        return (com.google.protobuf.ByteString) ref;
      }
    }

    private byte memoizedIsInitialized = -1;
    public final boolean isInitialized() {
      byte isInitialized = memoizedIsInitialized;
      if (isInitialized == 1) return true;
      if (isInitialized == 0) return false;

      memoizedIsInitialized = 1;
      return true;
    }

    public void writeTo(com.google.protobuf.CodedOutputStream output)
                        throws java.io.IOException {
      if (!getHOpCodeBytes().isEmpty()) {
        com.google.protobuf.GeneratedMessageV3.writeString(output, 1, hOpCode_);
      }
      if (errorCode_ != com.community.protobuf.UCErrorProto.UCErrorCode.ERROR_CODE_0.getNumber()) {
        output.writeEnum(2, errorCode_);
      }
      if (!getErrorHOpCodeBytes().isEmpty()) {
        com.google.protobuf.GeneratedMessageV3.writeString(output, 3, errorHOpCode_);
      }
      if (!getExtraMsgBytes().isEmpty()) {
        com.google.protobuf.GeneratedMessageV3.writeString(output, 4, extraMsg_);
      }
    }

    public int getSerializedSize() {
      int size = memoizedSize;
      if (size != -1) return size;

      size = 0;
      if (!getHOpCodeBytes().isEmpty()) {
        size += com.google.protobuf.GeneratedMessageV3.computeStringSize(1, hOpCode_);
      }
      if (errorCode_ != com.community.protobuf.UCErrorProto.UCErrorCode.ERROR_CODE_0.getNumber()) {
        size += com.google.protobuf.CodedOutputStream
          .computeEnumSize(2, errorCode_);
      }
      if (!getErrorHOpCodeBytes().isEmpty()) {
        size += com.google.protobuf.GeneratedMessageV3.computeStringSize(3, errorHOpCode_);
      }
      if (!getExtraMsgBytes().isEmpty()) {
        size += com.google.protobuf.GeneratedMessageV3.computeStringSize(4, extraMsg_);
      }
      memoizedSize = size;
      return size;
    }

    private static final long serialVersionUID = 0L;
    @Override
    public boolean equals(final Object obj) {
      if (obj == this) {
       return true;
      }
      if (!(obj instanceof com.community.protobuf.UCErrorProto.UCError)) {
        return super.equals(obj);
      }
      com.community.protobuf.UCErrorProto.UCError other = (com.community.protobuf.UCErrorProto.UCError) obj;

      boolean result = true;
      result = result && getHOpCode()
          .equals(other.getHOpCode());
      result = result && errorCode_ == other.errorCode_;
      result = result && getErrorHOpCode()
          .equals(other.getErrorHOpCode());
      result = result && getExtraMsg()
          .equals(other.getExtraMsg());
      return result;
    }

    @Override
    public int hashCode() {
      if (memoizedHashCode != 0) {
        return memoizedHashCode;
      }
      int hash = 41;
      hash = (19 * hash) + getDescriptorForType().hashCode();
      hash = (37 * hash) + HOPCODE_FIELD_NUMBER;
      hash = (53 * hash) + getHOpCode().hashCode();
      hash = (37 * hash) + ERRORCODE_FIELD_NUMBER;
      hash = (53 * hash) + errorCode_;
      hash = (37 * hash) + ERRORHOPCODE_FIELD_NUMBER;
      hash = (53 * hash) + getErrorHOpCode().hashCode();
      hash = (37 * hash) + EXTRAMSG_FIELD_NUMBER;
      hash = (53 * hash) + getExtraMsg().hashCode();
      hash = (29 * hash) + unknownFields.hashCode();
      memoizedHashCode = hash;
      return hash;
    }

    public static com.community.protobuf.UCErrorProto.UCError parseFrom(
        com.google.protobuf.ByteString data)
        throws com.google.protobuf.InvalidProtocolBufferException {
      return PARSER.parseFrom(data);
    }
    public static com.community.protobuf.UCErrorProto.UCError parseFrom(
        com.google.protobuf.ByteString data,
        com.google.protobuf.ExtensionRegistryLite extensionRegistry)
        throws com.google.protobuf.InvalidProtocolBufferException {
      return PARSER.parseFrom(data, extensionRegistry);
    }
    public static com.community.protobuf.UCErrorProto.UCError parseFrom(byte[] data)
        throws com.google.protobuf.InvalidProtocolBufferException {
      return PARSER.parseFrom(data);
    }
    public static com.community.protobuf.UCErrorProto.UCError parseFrom(
        byte[] data,
        com.google.protobuf.ExtensionRegistryLite extensionRegistry)
        throws com.google.protobuf.InvalidProtocolBufferException {
      return PARSER.parseFrom(data, extensionRegistry);
    }
    public static com.community.protobuf.UCErrorProto.UCError parseFrom(java.io.InputStream input)
        throws java.io.IOException {
      return com.google.protobuf.GeneratedMessageV3
          .parseWithIOException(PARSER, input);
    }
    public static com.community.protobuf.UCErrorProto.UCError parseFrom(
        java.io.InputStream input,
        com.google.protobuf.ExtensionRegistryLite extensionRegistry)
        throws java.io.IOException {
      return com.google.protobuf.GeneratedMessageV3
          .parseWithIOException(PARSER, input, extensionRegistry);
    }
    public static com.community.protobuf.UCErrorProto.UCError parseDelimitedFrom(java.io.InputStream input)
        throws java.io.IOException {
      return com.google.protobuf.GeneratedMessageV3
          .parseDelimitedWithIOException(PARSER, input);
    }
    public static com.community.protobuf.UCErrorProto.UCError parseDelimitedFrom(
        java.io.InputStream input,
        com.google.protobuf.ExtensionRegistryLite extensionRegistry)
        throws java.io.IOException {
      return com.google.protobuf.GeneratedMessageV3
          .parseDelimitedWithIOException(PARSER, input, extensionRegistry);
    }
    public static com.community.protobuf.UCErrorProto.UCError parseFrom(
        com.google.protobuf.CodedInputStream input)
        throws java.io.IOException {
      return com.google.protobuf.GeneratedMessageV3
          .parseWithIOException(PARSER, input);
    }
    public static com.community.protobuf.UCErrorProto.UCError parseFrom(
        com.google.protobuf.CodedInputStream input,
        com.google.protobuf.ExtensionRegistryLite extensionRegistry)
        throws java.io.IOException {
      return com.google.protobuf.GeneratedMessageV3
          .parseWithIOException(PARSER, input, extensionRegistry);
    }

    public Builder newBuilderForType() { return newBuilder(); }
    public static Builder newBuilder() {
      return DEFAULT_INSTANCE.toBuilder();
    }
    public static Builder newBuilder(com.community.protobuf.UCErrorProto.UCError prototype) {
      return DEFAULT_INSTANCE.toBuilder().mergeFrom(prototype);
    }
    public Builder toBuilder() {
      return this == DEFAULT_INSTANCE
          ? new Builder() : new Builder().mergeFrom(this);
    }

    @Override
    protected Builder newBuilderForType(
        BuilderParent parent) {
      Builder builder = new Builder(parent);
      return builder;
    }
    /**
     * Protobuf type {@code com.community.protobuf.UCError}
     */
    public static final class Builder extends
        com.google.protobuf.GeneratedMessageV3.Builder<Builder> implements
        // @@protoc_insertion_point(builder_implements:com.community.protobuf.UCError)
        com.community.protobuf.UCErrorProto.UCErrorOrBuilder {
      public static final com.google.protobuf.Descriptors.Descriptor
          getDescriptor() {
        return com.community.protobuf.UCErrorProto.internal_static_org_startpoint_protobuf_http_UCError_descriptor;
      }

      protected FieldAccessorTable
          internalGetFieldAccessorTable() {
        return com.community.protobuf.UCErrorProto.internal_static_org_startpoint_protobuf_http_UCError_fieldAccessorTable
            .ensureFieldAccessorsInitialized(
                com.community.protobuf.UCErrorProto.UCError.class, com.community.protobuf.UCErrorProto.UCError.Builder.class);
      }

      // Construct using com.community.protobuf.UCErrorProto.UCError.newBuilder()
      private Builder() {
        maybeForceBuilderInitialization();
      }

      private Builder(
          BuilderParent parent) {
        super(parent);
        maybeForceBuilderInitialization();
      }
      private void maybeForceBuilderInitialization() {
        if (com.google.protobuf.GeneratedMessageV3
                .alwaysUseFieldBuilders) {
        }
      }
      public Builder clear() {
        super.clear();
        hOpCode_ = "";

        errorCode_ = 0;

        errorHOpCode_ = "";

        extraMsg_ = "";

        return this;
      }

      public com.google.protobuf.Descriptors.Descriptor
          getDescriptorForType() {
        return com.community.protobuf.UCErrorProto.internal_static_org_startpoint_protobuf_http_UCError_descriptor;
      }

      public com.community.protobuf.UCErrorProto.UCError getDefaultInstanceForType() {
        return com.community.protobuf.UCErrorProto.UCError.getDefaultInstance();
      }

      public com.community.protobuf.UCErrorProto.UCError build() {
        com.community.protobuf.UCErrorProto.UCError result = buildPartial();
        if (!result.isInitialized()) {
          throw newUninitializedMessageException(result);
        }
        return result;
      }

      public com.community.protobuf.UCErrorProto.UCError buildPartial() {
        com.community.protobuf.UCErrorProto.UCError result = new com.community.protobuf.UCErrorProto.UCError(this);
        result.hOpCode_ = hOpCode_;
        result.errorCode_ = errorCode_;
        result.errorHOpCode_ = errorHOpCode_;
        result.extraMsg_ = extraMsg_;
        onBuilt();
        return result;
      }

      public Builder clone() {
        return (Builder) super.clone();
      }
      public Builder setField(
          com.google.protobuf.Descriptors.FieldDescriptor field,
          Object value) {
        return (Builder) super.setField(field, value);
      }
      public Builder clearField(
          com.google.protobuf.Descriptors.FieldDescriptor field) {
        return (Builder) super.clearField(field);
      }
      public Builder clearOneof(
          com.google.protobuf.Descriptors.OneofDescriptor oneof) {
        return (Builder) super.clearOneof(oneof);
      }
      public Builder setRepeatedField(
          com.google.protobuf.Descriptors.FieldDescriptor field,
          int index, Object value) {
        return (Builder) super.setRepeatedField(field, index, value);
      }
      public Builder addRepeatedField(
          com.google.protobuf.Descriptors.FieldDescriptor field,
          Object value) {
        return (Builder) super.addRepeatedField(field, value);
      }
      public Builder mergeFrom(com.google.protobuf.Message other) {
        if (other instanceof com.community.protobuf.UCErrorProto.UCError) {
          return mergeFrom((com.community.protobuf.UCErrorProto.UCError)other);
        } else {
          super.mergeFrom(other);
          return this;
        }
      }

      public Builder mergeFrom(com.community.protobuf.UCErrorProto.UCError other) {
        if (other == com.community.protobuf.UCErrorProto.UCError.getDefaultInstance()) return this;
        if (!other.getHOpCode().isEmpty()) {
          hOpCode_ = other.hOpCode_;
          onChanged();
        }
        if (other.errorCode_ != 0) {
          setErrorCodeValue(other.getErrorCodeValue());
        }
        if (!other.getErrorHOpCode().isEmpty()) {
          errorHOpCode_ = other.errorHOpCode_;
          onChanged();
        }
        if (!other.getExtraMsg().isEmpty()) {
          extraMsg_ = other.extraMsg_;
          onChanged();
        }
        onChanged();
        return this;
      }

      public final boolean isInitialized() {
        return true;
      }

      public Builder mergeFrom(
          com.google.protobuf.CodedInputStream input,
          com.google.protobuf.ExtensionRegistryLite extensionRegistry)
          throws java.io.IOException {
        com.community.protobuf.UCErrorProto.UCError parsedMessage = null;
        try {
          parsedMessage = PARSER.parsePartialFrom(input, extensionRegistry);
        } catch (com.google.protobuf.InvalidProtocolBufferException e) {
          parsedMessage = (com.community.protobuf.UCErrorProto.UCError) e.getUnfinishedMessage();
          throw e.unwrapIOException();
        } finally {
          if (parsedMessage != null) {
            mergeFrom(parsedMessage);
          }
        }
        return this;
      }

      private Object hOpCode_ = "";
      /**
       * <code>optional string hOpCode = 1;</code>
       */
      public String getHOpCode() {
        Object ref = hOpCode_;
        if (!(ref instanceof String)) {
          com.google.protobuf.ByteString bs =
              (com.google.protobuf.ByteString) ref;
          String s = bs.toStringUtf8();
          hOpCode_ = s;
          return s;
        } else {
          return (String) ref;
        }
      }
      /**
       * <code>optional string hOpCode = 1;</code>
       */
      public com.google.protobuf.ByteString
          getHOpCodeBytes() {
        Object ref = hOpCode_;
        if (ref instanceof String) {
          com.google.protobuf.ByteString b = 
              com.google.protobuf.ByteString.copyFromUtf8(
                  (String) ref);
          hOpCode_ = b;
          return b;
        } else {
          return (com.google.protobuf.ByteString) ref;
        }
      }
      /**
       * <code>optional string hOpCode = 1;</code>
       */
      public Builder setHOpCode(
          String value) {
        if (value == null) {
    throw new NullPointerException();
  }
  
        hOpCode_ = value;
        onChanged();
        return this;
      }
      /**
       * <code>optional string hOpCode = 1;</code>
       */
      public Builder clearHOpCode() {
        
        hOpCode_ = getDefaultInstance().getHOpCode();
        onChanged();
        return this;
      }
      /**
       * <code>optional string hOpCode = 1;</code>
       */
      public Builder setHOpCodeBytes(
          com.google.protobuf.ByteString value) {
        if (value == null) {
    throw new NullPointerException();
  }
  checkByteStringIsUtf8(value);
        
        hOpCode_ = value;
        onChanged();
        return this;
      }

      private int errorCode_ = 0;
      /**
       * <code>optional .com.community.protobuf.UCErrorCode errorCode = 2;</code>
       */
      public int getErrorCodeValue() {
        return errorCode_;
      }
      /**
       * <code>optional .com.community.protobuf.UCErrorCode errorCode = 2;</code>
       */
      public Builder setErrorCodeValue(int value) {
        errorCode_ = value;
        onChanged();
        return this;
      }
      /**
       * <code>optional .com.community.protobuf.UCErrorCode errorCode = 2;</code>
       */
      public com.community.protobuf.UCErrorProto.UCErrorCode getErrorCode() {
        com.community.protobuf.UCErrorProto.UCErrorCode result = com.community.protobuf.UCErrorProto.UCErrorCode.valueOf(errorCode_);
        return result == null ? com.community.protobuf.UCErrorProto.UCErrorCode.UNRECOGNIZED : result;
      }
      /**
       * <code>optional .com.community.protobuf.UCErrorCode errorCode = 2;</code>
       */
      public Builder setErrorCode(com.community.protobuf.UCErrorProto.UCErrorCode value) {
        if (value == null) {
          throw new NullPointerException();
        }
        
        errorCode_ = value.getNumber();
        onChanged();
        return this;
      }
      /**
       * <code>optional .com.community.protobuf.UCErrorCode errorCode = 2;</code>
       */
      public Builder clearErrorCode() {
        
        errorCode_ = 0;
        onChanged();
        return this;
      }

      private Object errorHOpCode_ = "";
      /**
       * <code>optional string errorHOpCode = 3;</code>
       */
      public String getErrorHOpCode() {
        Object ref = errorHOpCode_;
        if (!(ref instanceof String)) {
          com.google.protobuf.ByteString bs =
              (com.google.protobuf.ByteString) ref;
          String s = bs.toStringUtf8();
          errorHOpCode_ = s;
          return s;
        } else {
          return (String) ref;
        }
      }
      /**
       * <code>optional string errorHOpCode = 3;</code>
       */
      public com.google.protobuf.ByteString
          getErrorHOpCodeBytes() {
        Object ref = errorHOpCode_;
        if (ref instanceof String) {
          com.google.protobuf.ByteString b = 
              com.google.protobuf.ByteString.copyFromUtf8(
                  (String) ref);
          errorHOpCode_ = b;
          return b;
        } else {
          return (com.google.protobuf.ByteString) ref;
        }
      }
      /**
       * <code>optional string errorHOpCode = 3;</code>
       */
      public Builder setErrorHOpCode(
          String value) {
        if (value == null) {
    throw new NullPointerException();
  }
  
        errorHOpCode_ = value;
        onChanged();
        return this;
      }
      /**
       * <code>optional string errorHOpCode = 3;</code>
       */
      public Builder clearErrorHOpCode() {
        
        errorHOpCode_ = getDefaultInstance().getErrorHOpCode();
        onChanged();
        return this;
      }
      /**
       * <code>optional string errorHOpCode = 3;</code>
       */
      public Builder setErrorHOpCodeBytes(
          com.google.protobuf.ByteString value) {
        if (value == null) {
    throw new NullPointerException();
  }
  checkByteStringIsUtf8(value);
        
        errorHOpCode_ = value;
        onChanged();
        return this;
      }

      private Object extraMsg_ = "";
      /**
       * <code>optional string extraMsg = 4;</code>
       */
      public String getExtraMsg() {
        Object ref = extraMsg_;
        if (!(ref instanceof String)) {
          com.google.protobuf.ByteString bs =
              (com.google.protobuf.ByteString) ref;
          String s = bs.toStringUtf8();
          extraMsg_ = s;
          return s;
        } else {
          return (String) ref;
        }
      }
      /**
       * <code>optional string extraMsg = 4;</code>
       */
      public com.google.protobuf.ByteString
          getExtraMsgBytes() {
        Object ref = extraMsg_;
        if (ref instanceof String) {
          com.google.protobuf.ByteString b = 
              com.google.protobuf.ByteString.copyFromUtf8(
                  (String) ref);
          extraMsg_ = b;
          return b;
        } else {
          return (com.google.protobuf.ByteString) ref;
        }
      }
      /**
       * <code>optional string extraMsg = 4;</code>
       */
      public Builder setExtraMsg(
          String value) {
        if (value == null) {
    throw new NullPointerException();
  }
  
        extraMsg_ = value;
        onChanged();
        return this;
      }
      /**
       * <code>optional string extraMsg = 4;</code>
       */
      public Builder clearExtraMsg() {
        
        extraMsg_ = getDefaultInstance().getExtraMsg();
        onChanged();
        return this;
      }
      /**
       * <code>optional string extraMsg = 4;</code>
       */
      public Builder setExtraMsgBytes(
          com.google.protobuf.ByteString value) {
        if (value == null) {
    throw new NullPointerException();
  }
  checkByteStringIsUtf8(value);
        
        extraMsg_ = value;
        onChanged();
        return this;
      }
      public final Builder setUnknownFields(
          final com.google.protobuf.UnknownFieldSet unknownFields) {
        return this;
      }

      public final Builder mergeUnknownFields(
          final com.google.protobuf.UnknownFieldSet unknownFields) {
        return this;
      }


      // @@protoc_insertion_point(builder_scope:com.community.protobuf.UCError)
    }

    // @@protoc_insertion_point(class_scope:com.community.protobuf.UCError)
    private static final com.community.protobuf.UCErrorProto.UCError DEFAULT_INSTANCE;
    static {
      DEFAULT_INSTANCE = new com.community.protobuf.UCErrorProto.UCError();
    }

    public static com.community.protobuf.UCErrorProto.UCError getDefaultInstance() {
      return DEFAULT_INSTANCE;
    }

    private static final com.google.protobuf.Parser<UCError>
        PARSER = new com.google.protobuf.AbstractParser<UCError>() {
      public UCError parsePartialFrom(
          com.google.protobuf.CodedInputStream input,
          com.google.protobuf.ExtensionRegistryLite extensionRegistry)
          throws com.google.protobuf.InvalidProtocolBufferException {
          return new UCError(input, extensionRegistry);
      }
    };

    public static com.google.protobuf.Parser<UCError> parser() {
      return PARSER;
    }

    @Override
    public com.google.protobuf.Parser<UCError> getParserForType() {
      return PARSER;
    }

    public com.community.protobuf.UCErrorProto.UCError getDefaultInstanceForType() {
      return DEFAULT_INSTANCE;
    }

  }

  private static final com.google.protobuf.Descriptors.Descriptor
    internal_static_org_startpoint_protobuf_http_UCError_descriptor;
  private static final 
    com.google.protobuf.GeneratedMessageV3.FieldAccessorTable
      internal_static_org_startpoint_protobuf_http_UCError_fieldAccessorTable;

  public static com.google.protobuf.Descriptors.FileDescriptor
      getDescriptor() {
    return descriptor;
  }
  private static  com.google.protobuf.Descriptors.FileDescriptor
      descriptor;
  static {
    String[] descriptorData = {
      "\n\022UCErrorProto.proto\022\034org.startpoint.pro" +
      "tobuf.http\"\200\001\n\007UCError\022\017\n\007hOpCode\030\001 \001(\t\022" +
      "<\n\terrorCode\030\002 \001(\0162).org.startpoint.prot" +
      "obuf.http.UCErrorCode\022\024\n\014errorHOpCode\030\003 " +
      "\001(\t\022\020\n\010extraMsg\030\004 \001(\t*\331\002\n\013UCErrorCode\022\020\n" +
      "\014ERROR_CODE_0\020\000\022\020\n\014ERROR_CODE_1\020\001\022\020\n\014ERR" +
      "OR_CODE_2\020\002\022\020\n\014ERROR_CODE_3\020\003\022\020\n\014ERROR_C" +
      "ODE_4\020\004\022\020\n\014ERROR_CODE_5\020\005\022\020\n\014ERROR_CODE_" +
      "6\020\006\022\020\n\014ERROR_CODE_7\020\007\022\020\n\014ERROR_CODE_8\020\010\022" +
      "\020\n\014ERROR_CODE_9\020\t\022\021\n\rERROR_CODE_10\020\n\022\021\n\r",
      "ERROR_CODE_11\020\013\022\021\n\rERROR_CODE_12\020\014\022\021\n\rER" +
      "ROR_CODE_13\020\r\022\021\n\rERROR_CODE_14\020\016\022\021\n\rERRO" +
      "R_CODE_15\020\017\022\021\n\rERROR_CODE_16\020\020\022\021\n\rERROR_" +
      "CODE_17\020\021b\006proto3"
    };
    com.google.protobuf.Descriptors.FileDescriptor.InternalDescriptorAssigner assigner =
        new com.google.protobuf.Descriptors.FileDescriptor.    InternalDescriptorAssigner() {
          public com.google.protobuf.ExtensionRegistry assignDescriptors(
              com.google.protobuf.Descriptors.FileDescriptor root) {
            descriptor = root;
            return null;
          }
        };
    com.google.protobuf.Descriptors.FileDescriptor
      .internalBuildGeneratedFileFrom(descriptorData,
        new com.google.protobuf.Descriptors.FileDescriptor[] {
        }, assigner);
    internal_static_org_startpoint_protobuf_http_UCError_descriptor =
      getDescriptor().getMessageTypes().get(0);
    internal_static_org_startpoint_protobuf_http_UCError_fieldAccessorTable = new
      com.google.protobuf.GeneratedMessageV3.FieldAccessorTable(
        internal_static_org_startpoint_protobuf_http_UCError_descriptor,
        new String[] { "HOpCode", "ErrorCode", "ErrorHOpCode", "ExtraMsg", });
  }

  // @@protoc_insertion_point(outer_class_scope)
}
