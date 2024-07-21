import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';

part 'user.g.dart';

/// All possible roles user can have.
enum Role { admin, agent, moderator, user }

/// A class that represents user.
@JsonSerializable()
@immutable
abstract class User extends Equatable {
  /// Creates a user.
  const User._({
    this.countryCode,
    this.phone_number,
    this.normalise_phone_number,
    this.createdAt,
    this.firstName,
    required this.id,
    this.imageUrl,
    this.lastName,
    this.lastSeen,
    this.metadata,
    this.role,
    this.updatedAt,
  });

  const factory User({
    int? createdAt,
    String? firstName,
    required String id,
    String? imageUrl,
    String? countryCode,
    String? phone_number,
    String? normalise_phone_number,
    String? lastName,
    int? lastSeen,
    Map<String, dynamic>? metadata,
    Role? role,
    int? updatedAt,
  }) = _User;

  /// Creates user from a map (decoded JSON).
  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  /// Created user timestamp, in ms.
  final int? createdAt;

  /// First name of the user.
  final String? firstName;

  /// Unique ID of the user.
  final String id;

  /// Remote image URL representing user's avatar.
  final String? imageUrl;

  /// Last name of the user.
  final String? lastName;

  /// Timestamp when user was last visible, in ms.
  final int? lastSeen;

  /// Additional custom metadata or attributes related to the user.
  final Map<String, dynamic>? metadata;

  /// User [Role].
  final Role? role;

  /// Updated user timestamp, in ms.
  final int? updatedAt;

  /// country code
  final String? countryCode;

  /// phone number
  final String? phone_number;

  /// normalise phone number
  final String? normalise_phone_number;

  /// Equatable props.
  @override
  List<Object?> get props => [
        createdAt,
        firstName,
        countryCode,
        phone_number,
        normalise_phone_number,
        id,
        imageUrl,
        lastName,
        lastSeen,
        metadata,
        role,
        updatedAt,
      ];

  User copyWith({
    int? createdAt,
    String? firstName,
    String? id,
    String? imageUrl,
    String? countryCode,
    String? phone_number,
    String? normalise_phone_number,
    String? lastName,
    int? lastSeen,
    Map<String, dynamic>? metadata,
    Role? role,
    int? updatedAt,
  });

  /// Converts user to the map representation, encodable to JSON.
  Map<String, dynamic> toJson() => _$UserToJson(this);
}

/// A utility class to enable better copyWith.
class _User extends User {
  const _User({
    super.createdAt,
    super.firstName,
    required super.id,
    super.imageUrl,
    super.lastName,
    super.countryCode,
    super.phone_number,
    super.normalise_phone_number,
    super.lastSeen,
    super.metadata,
    super.role,
    super.updatedAt,
  }) : super._();

  @override
  User copyWith({
    dynamic createdAt = _Unset,
    dynamic firstName = _Unset,
    dynamic countryCode = _Unset,
    dynamic phone_number = _Unset,
    dynamic normalise_phone_number = _Unset,
    String? id,
    dynamic imageUrl = _Unset,
    dynamic lastName = _Unset,
    dynamic lastSeen = _Unset,
    dynamic metadata = _Unset,
    dynamic role = _Unset,
    dynamic updatedAt = _Unset,
  }) =>
      _User(
        createdAt: createdAt == _Unset ? this.createdAt : createdAt as int?,
        firstName: firstName == _Unset ? this.firstName : firstName as String?,
        countryCode: countryCode == _Unset ? this.countryCode : countryCode as String?,
        phone_number: phone_number == _Unset ? this.phone_number : phone_number as String?,
        normalise_phone_number: normalise_phone_number == _Unset ? this.normalise_phone_number : normalise_phone_number as String?,
        id: id ?? this.id,
        imageUrl: imageUrl == _Unset ? this.imageUrl : imageUrl as String?,
        lastName: lastName == _Unset ? this.lastName : lastName as String?,
        lastSeen: lastSeen == _Unset ? this.lastSeen : lastSeen as int?,
        metadata: metadata == _Unset ? this.metadata : metadata as Map<String, dynamic>?,
        role: role == _Unset ? this.role : role as Role?,
        updatedAt: updatedAt == _Unset ? this.updatedAt : updatedAt as int?,
      );
}

class _Unset {}
