import 'package:bloc/bloc.dart';
import 'package:eduvibe/presentation/profile/cubit/profile_ui.dart';
import 'package:equatable/equatable.dart';

part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit() : super(ProfileLoading());

  void getProfile() async {
    emit(ProfileLoading());
    try {
      await Future.delayed(const Duration(seconds: 1));
      final profile = await _fetchProfile();
      emit(ProfileSuccess(profile));
    } catch (e) {
      emit(ProfileError(e.toString()));
    }
  }

  void updateProfile({required String name}) async {
    emit(ProfileLoading());
    try {
      await Future.delayed(const Duration(seconds: 1));
      final profile = await _fetchProfile(
        name: name,
      );
      emit(ProfileSuccess(profile));
    } catch (e) {
      emit(ProfileError(e.toString()));
    }
  }

  Future<void> changePassword({
    required String oldPassword,
    required String newPassword,
  }) async {
    emit(ProfileLoading());
    try {
      await Future.delayed(const Duration(seconds: 1));
      emit(ProfilePasswordChanged());
    } catch (e) {
      emit(ProfileError(e.toString()));
    }
  }

  Future<ProfileUI> _fetchProfile({String? name}) async {
    return ProfileUI(
      name: name ?? 'Radwa R. Abdallah',
      email: 'Radwa@gmail.com',
      phone: '+201038475893',
      university: 'Cairo University',
      avatar: 'https://i.pravatar.cc/150?img=1',
      chartData: ChartData(
        ratio: 0.75,
        items: [
          ChartDataItem(title: 'Sat', value: 0.5),
          ChartDataItem(title: 'Sun', value: 0.75),
          ChartDataItem(title: 'Mon', value: 0.25),
          ChartDataItem(title: 'Tue', value: 0.6),
          ChartDataItem(title: 'Wed', value: 0.45),
          ChartDataItem(title: 'Thu', value: 0.9),
          ChartDataItem(title: 'Fri', value: 0.3),
        ],
      ),
    );
  }
}
