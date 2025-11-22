.info
  .source "lope_TIF_DBG_three.psc"
  .modifyTime 1739188754
  .compileTime 1739188756
  .user "Dima"
  .computer "TOPPC"
.endInfo
.userFlagsRef
  .flag conditional 1
  .flag hidden 0
.endUserFlagsRef
.objectTable
  .object lope_TIF_DBG_three TopicInfo
    .userFlags 1
    .docString ""
    .autoState 
    .variableTable
    .endVariableTable
    .propertyTable
    .endPropertyTable
    .stateTable
      .state
        .function GetState
          .userFlags 0
          .docString "Function that returns the current state"
          .return String
          .paramTable
          .endParamTable
          .localTable
          .endLocalTable
          .code
            RETURN ::state
          .endCode
        .endFunction
        .function GotoState
          .userFlags 0
          .docString "Function that switches this object to the specified state"
          .return None
          .paramTable
            .param newState String
          .endParamTable
          .localTable
            .local ::NoneVar None
          .endLocalTable
          .code
            CALLMETHOD onEndState self ::NoneVar
            ASSIGN ::state newState
            CALLMETHOD onBeginState self ::NoneVar
          .endCode
        .endFunction
        .function Fragment_0 
          .userFlags 0
          .docString ""
          .return NONE
          .paramTable
            .param akSpeakerRef ObjectReference
          .endParamTable
          .localTable
            .local ::temp0 actor
            .local akSpeaker Actor
          .endLocalTable
          .code
            CAST ::temp0 akSpeakerRef ;@line 7
            ASSIGN akSpeaker ::temp0 ;@line 7
          .endCode
        .endFunction
      .endState
    .endStateTable
  .endObject
.endObjectTable