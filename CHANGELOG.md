# Changelog
All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [Unreleased]

### Added

- Mostly automatic support `Ecto.Type` (including for builtin interval types)

### Changed

### Deprecated

### Removed

### Fixed

### Security

## [v0.2.0] - 2022-10-27

### Added

- Allow opting out of built in implementations by configuring `:interval, Interval.Float: false`
- Adding `Interval.Intervalable` protocol, which allows you to define what interval implementation
  to use for value types. This is purely for ergonomic reasons.
- Special-case for empty intervals, which doesn't require implementation-specific behaviour.
- Adding `Interval.contains_point?/2`
- Adding `Interval.partition/2`
- Adding `Interval.size/1`

### Changed

- Various `RuntimeError`s handling bad input to a function has been converted to `ArgumentError`s
- `Point.previous(a)` and `Point.next(a)` became `point_step/2` in the `Interval.Behaviour`.
- `Interval.new/1` now requires a `:module` option of the specific implementation to use,
  however the implementation has a `new/1` that infers this when creating new intervals.

### Removed

- The idea of a "zero" point was removed because it doesn't make sense for all intervals.
- Removed the `Interval.Point` protocol in favor of a behaviour for the entire interval.
- Removed `Interval.size/2`

## [v0.1.3] - 2022-10-12

### Added

- Added `Interval.size/2`.
- Added parameterized typespec `t:Interval.t/1`

### Changed

- The internal `Endpoint` struct has been replaced by a simple 2-tuple.
- Empty intervals are now represented by two identical exclusive points. 

### Fixed

- Fixed a bug in `Interval.intersection/2` and `Interval.union/2` that causes incorrect bounds
  in some cases.

## [v0.1.2] - 2022-10-10

### Fixed

- Fixed a correctness bug in intersection, where intersections between
  intervals containing unbounded endpoints would be incorrectly computed.