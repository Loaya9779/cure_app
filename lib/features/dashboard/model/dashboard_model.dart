import 'package:cuer_app/core/utils/colors.dart';
import 'package:flutter/material.dart';

class DashboardItemModel{
  final String title;
  final int count;
  final Color color;

  DashboardItemModel({
    required this.title,
    required this.count,
    required this.color,
  });

static final List<DashboardItemModel> dashboardItems = [
  DashboardItemModel(
    title: "Active Bookings",
    count: 2,
    color: AppColors.dashboardCards[0],
  ),
  DashboardItemModel(
    title: "Upcoming Visits",
    count: 1,
    color: AppColors.dashboardCards[1],
  ),
  DashboardItemModel(
    title: "History",
    count: 5,
    color: AppColors.dashboardCards[2],
  ),
];
}