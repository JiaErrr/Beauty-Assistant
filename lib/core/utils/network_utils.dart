import 'dart:io';
import 'package:connectivity_plus/connectivity_plus.dart';

/// Network utility functions for handling network operations
class NetworkUtils {
  // Private constructor to prevent instantiation
  NetworkUtils._();
  
  // Singleton instance of Connectivity
  static final Connectivity _connectivity = Connectivity();
  
  /// Checks if the device is connected to the internet
  /// 
  /// Returns true if connected, false otherwise
  static Future<bool> isConnected() async {
    try {
      final ConnectivityResult result = await _connectivity.checkConnectivity();
      return result != ConnectivityResult.none;
    } catch (e) {
      return false;
    }
  }
  
  /// Checks if the device has an active internet connection by making a request
  /// 
  /// This is more reliable than isConnected() as it actually tests the connection
  static Future<bool> hasInternetConnection() async {
    try {
      final List<InternetAddress> result = await InternetAddress.lookup('google.com');
      return result.isNotEmpty && result[0].rawAddress.isNotEmpty;
    } on SocketException catch (_) {
      return false;
    } catch (_) {
      return false;
    }
  }
  
  /// Gets the current connection type
  /// 
  /// Returns the ConnectivityResult enum value
  static Future<ConnectivityResult> getConnectionType() async {
    try {
      return await _connectivity.checkConnectivity();
    } catch (e) {
      return ConnectivityResult.none;
    }
  }
  
  /// Gets a stream of connectivity changes
  /// 
  /// Useful for listening to network state changes
  static Stream<ConnectivityResult> get connectivityStream {
    return _connectivity.onConnectivityChanged;
  }
  
  /// Checks if the connection is WiFi
  /// 
  /// Returns true if connected via WiFi, false otherwise
  static Future<bool> isWiFiConnected() async {
    final ConnectivityResult result = await getConnectionType();
    return result == ConnectivityResult.wifi;
  }
  
  /// Checks if the connection is mobile data
  /// 
  /// Returns true if connected via mobile data, false otherwise
  static Future<bool> isMobileConnected() async {
    final ConnectivityResult result = await getConnectionType();
    return result == ConnectivityResult.mobile;
  }
  
  /// Checks if the connection is ethernet
  /// 
  /// Returns true if connected via ethernet, false otherwise
  static Future<bool> isEthernetConnected() async {
    final ConnectivityResult result = await getConnectionType();
    return result == ConnectivityResult.ethernet;
  }
  
  /// Gets a human-readable connection type string
  /// 
  /// Returns a string representation of the connection type
  static Future<String> getConnectionTypeString() async {
    final ConnectivityResult result = await getConnectionType();
    switch (result) {
      case ConnectivityResult.wifi:
        return 'WiFi';
      case ConnectivityResult.mobile:
        return 'Mobile Data';
      case ConnectivityResult.ethernet:
        return 'Ethernet';
      case ConnectivityResult.bluetooth:
        return 'Bluetooth';
      case ConnectivityResult.vpn:
        return 'VPN';
      case ConnectivityResult.other:
        return 'Other';
      case ConnectivityResult.none:
      default:
        return 'No Connection';
    }
  }
  
  /// Validates if a URL is properly formatted
  /// 
  /// Returns true if the URL is valid, false otherwise
  static bool isValidUrl(String url) {
    try {
      final Uri uri = Uri.parse(url);
      return uri.hasScheme && (uri.scheme == 'http' || uri.scheme == 'https');
    } catch (e) {
      return false;
    }
  }
  
  /// Extracts the domain from a URL
  /// 
  /// Returns the domain string or null if invalid
  static String? extractDomain(String url) {
    try {
      final Uri uri = Uri.parse(url);
      return uri.host;
    } catch (e) {
      return null;
    }
  }
}