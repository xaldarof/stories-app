import 'package:jokes_app/common/utils/date.dart';
import 'package:jokes_app/domain/mappers/base_mapper.dart';
import 'package:jokes_app/domain/models/network/profile_response.dart';
import 'package:jokes_app/domain/models/ui/profile.dart';

class UserMapper extends Mapper<UserResponse, User> {
  @override
  User map(UserResponse data) {
    return User(
      id: data.id,
      username: data.username,
      dateJoined: data.dateJoined.toDate(),
      firstName: data.firstName,
      lastName: data.lastName,
      email: data.email,
    );
  }
}
