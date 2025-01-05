import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../../core/widget/core_widget.dart';
import '../../../../../../core/widget/custom_widget.dart';
import '../bloc/campaign_bloc.dart';
import '../bloc/listing_bloc.dart';
import '../bloc/listing_event.dart';
import '../bloc/listing_state.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import '../widget/apartment_listing.dart';

class ExploreScreen extends StatefulWidget {
  const ExploreScreen({Key? key}) : super(key: key);

  @override
  State<ExploreScreen> createState() => _ExploreScreenState();
}

class _ExploreScreenState extends State<ExploreScreen> {
  int _selectedIndex = 0; // Tracks the selected tab

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      body: SafeArea(
        child: Column(
          children: [
            searchButton(), // Assumes this is a custom widget for search
            SizedBox(
              height: 66,
              child: BlocListener<CampaignBloc, CampaignState>(
                listener: (context, state) {
                  if (state is CampaignError) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text(state.message)),
                    );
                  } else if (state is CampaignLoaded) {
                    if (state.campaigns.isNotEmpty) {
                      // Automatically load listings for the first campaign
                      context.read<ListingBloc>().add(
                          FetchListingsEvent(state.campaigns.first.id));
                    }
                  }
                },
                child: BlocBuilder<CampaignBloc, CampaignState>(
                  builder: (context, state) {
                    if (state is CampaignLoading) {
                      return const Center(child: CircularProgressIndicator());
                    } else if (state is CampaignLoaded) {
                      return ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: state.campaigns.length,
                        itemBuilder: (context, index) {
                          final isSelected = _selectedIndex == index;
                          final campaign = state.campaigns[index];

                          return InkWell(
                            splashColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () {
                              setState(() {
                                _selectedIndex = index;
                              });
                              context
                                  .read<ListingBloc>()
                                  .add(FetchListingsEvent(campaign.id));
                            },
                            child: Padding(
                              padding:
                              const EdgeInsets.symmetric(horizontal: 16),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  CachedNetworkImage(
                                    imageUrl: campaign.image,
                                    height: 30,
                                    width: 30,
                                  ),
                                  const SizedBox(height: 4),
                                  Column(
                                    children: [
                                      Text(
                                        campaign.title,
                                        style: TextStyle(
                                          fontSize: 14,
                                          color: isSelected
                                              ? Colors.black
                                              : Colors.grey,
                                          fontWeight: isSelected
                                              ? FontWeight.bold
                                              : FontWeight.normal,
                                        ),
                                      ),
                                      const SizedBox(height: 4),
                                      if (isSelected)
                                        Container(
                                          height: 2,
                                          width: campaign.title.length * 7.0,
                                          color: Colors.black,
                                        ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      );
                    } else if (state is CampaignError) {
                      return Center(child: Text(state.message));
                    }
                    return const Center(child: Text("No campaigns found"));
                  },
                ),
              ),
            ),
            Expanded(
              child: BlocBuilder<ListingBloc, ListingState>(
                builder: (context, state) {
                  if (state is ListingLoading) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (state is ListingLoaded) {
                    return ListView.builder(
                      itemCount: state.listings.length,
                      itemBuilder: (context, index) {
                        final listing = state.listings[index];
                        return ApartmentListing(
                          location: listing.title ?? "",
                          price: listing.price ?? 0,
                          rating: listing.averageRating ?? 0.0,
                          ratingCount: listing.totalAverage ?? 0,
                          img: listing.imageUrl ?? "",
                        );
                      },
                    );
                  } else if (state is ListingError) {
                    return Center(child: Text(state.message));
                  }
                  return const Center(child: Text("No listings found"));
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}


