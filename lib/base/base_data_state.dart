import 'package:blockrx/base/base_response_data.dart';
import 'package:blockrx/base/base_ui_state.dart';

class BaseDataState extends BaseUiState<BaseResponseData> {
  BaseDataState.loading() : super.loading();

  BaseDataState.completed(BaseResponseData data) : super.completed(data: data);

  BaseDataState.error(dynamic error) : super.error(error);
}
