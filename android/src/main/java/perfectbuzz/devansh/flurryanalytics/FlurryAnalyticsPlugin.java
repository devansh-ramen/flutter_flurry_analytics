package perfectbuzz.devansh.flurryanalytics;

import android.content.Context;
import android.util.Log;

import com.flurry.android.FlurryAgent;

import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.MethodChannel;
import io.flutter.plugin.common.MethodChannel.MethodCallHandler;
import io.flutter.plugin.common.MethodChannel.Result;
import io.flutter.plugin.common.PluginRegistry.Registrar;

import static android.content.ContentValues.TAG;

/** FlurryAnalyticsPlugin */
public class FlurryAnalyticsPlugin implements MethodCallHandler {
  private Context activity;
  private MethodChannel channel;

  /** Plugin registration. */
  public static void registerWith(Registrar registrar) {
    final MethodChannel channel = new MethodChannel(registrar.messenger(), "flurry_analytics");
    channel.setMethodCallHandler(new FlurryAnalyticsPlugin(registrar.activeContext(), channel));
  }

  public FlurryAnalyticsPlugin(Context activity, MethodChannel channel) {
    this.activity = activity;
    this.channel = channel;
    this.channel.setMethodCallHandler(this);
  }


  private void initializeFlurry(String FLURRY_API_KEY, boolean isLogEnabled) {
    new FlurryAgent.Builder()
            .withLogEnabled(isLogEnabled)
            .withCaptureUncaughtExceptions(true)
            .withContinueSessionMillis(10000)
            .withLogLevel(Log.DEBUG)
            .build(activity, FLURRY_API_KEY);
  }

  private void logEvent(String message) {
    FlurryAgent.logEvent(message);
  }

  @Override
  public void onMethodCall(MethodCall call, Result result) {
    if (call.method.equals("initialize")) {
      String API_KEY = call.argument("api_key_android");
      boolean showLog = call.argument("is_log_enabled");

      initializeFlurry(API_KEY, showLog);

    } else if (call.method.equals("logEvent")) {
      String message = call.argument("message").toString();
      logEvent(message);
      Log.d(TAG, "onMethodCall: log event");
    } else {
      result.notImplemented();
    }
  }
}
