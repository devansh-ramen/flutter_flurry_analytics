package perfectbuzz.devansh.flurryanalytics;

import android.content.Context;
import android.util.Log;

import com.flurry.android.FlurryAgent;
import com.flurry.android.FlurryPerformance;

import java.util.Map;

import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.MethodChannel;
import io.flutter.plugin.common.MethodChannel.MethodCallHandler;
import io.flutter.plugin.common.MethodChannel.Result;
import io.flutter.plugin.common.PluginRegistry.Registrar;

/**
 * FlurryAnalyticsPlugin
 */
public class FlurryAnalyticsPlugin implements MethodCallHandler {
    private Context activity;
    private MethodChannel channel;

    /**
     * Plugin registration.
     */
    public static void registerWith(Registrar registrar) {
        final MethodChannel channel = new MethodChannel(registrar.messenger(), "flurry_analytics");
        channel.setMethodCallHandler(new FlurryAnalyticsPlugin(registrar.activeContext(), channel));
    }

    public FlurryAnalyticsPlugin(Context activity, MethodChannel channel) {
        this.activity = activity;
        this.channel = channel;
        this.channel.setMethodCallHandler(this);
    }

    @Override
    public void onMethodCall(MethodCall call, final Result result) {
        if (call.method.equals("initialize")) {
            handleInitialize(call, result);
        } else if (call.method.equals("logEvent")) {
            handleLogEvent(call, result);
        } else if (call.method.equals("endTimedEvent")) {
            handleEndTimedEvent(call, result);
        } else if (call.method.equals("userId")) {
            handleSetUserId(call, result);
        } else {
            result.notImplemented();
        }
    }

    private void handleInitialize(final MethodCall call, final Result result) {
        String apiKey = call.argument("api_key_android");
        boolean isLogEnabled = call.argument("is_log_enabled");
        boolean isPerfMetrics = call.argument("is_performance_metrics");
        String appVersion = call.argument("app_version");

        new FlurryAgent.Builder()
                .withLogEnabled(isLogEnabled)
                .withCaptureUncaughtExceptions(true)
                .withContinueSessionMillis(10000)
                .withLogLevel(Log.DEBUG)
                .withPerformanceMetrics(isPerfMetrics ? FlurryPerformance.All : FlurryPerformance.None)
                .build(activity, apiKey);

        if (appVersion != null) {
            FlurryAgent.setVersionName(appVersion);
        }

        result.success(null);
    }

    private void handleLogEvent(final MethodCall call, final Result result) {
        String eventName = call.argument("event");
        Map<String, String> parameters = call.argument("parameters");

        if (eventName != null && parameters != null)
            FlurryAgent.logEvent(eventName, parameters);
        result.success(null);
    }

    private void handleEndTimedEvent(final MethodCall call, final Result result) {
        String eventName = call.argument("event");

        if (eventName != null)
            FlurryAgent.endTimedEvent(eventName);
        result.success(null);
    }

    private void handleSetUserId(final MethodCall call, final Result result) {
        String userId = call.argument("userId");

        if (userId != null)
            FlurryAgent.setUserId(userId);
        result.success(null);
    }
}
