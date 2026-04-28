import Foundation

@available(macOS 14.2, *)
@MainActor
final class SettingsStateManager: ObservableObject {
    @Published var peakLimiter: Bool = false
    @Published var maxGainDB: Float = 12
    @Published var autoScale: Bool = true
    @Published var preEqSpectrumEnabled: Bool = false
    @Published var postEqSpectrumEnabled: Bool = false
    @Published var showBandwidthAsQ: Bool = true

    static let shared = SettingsStateManager()

    private init() {
        loadFromDefaults()
    }

    private func loadFromDefaults() {
        let state = iQualizeState.load()
        peakLimiter = state.peakLimiter
        maxGainDB = state.maxGainDB
        autoScale = state.autoScale
        preEqSpectrumEnabled = state.preEqSpectrumEnabled
        postEqSpectrumEnabled = state.postEqSpectrumEnabled
        showBandwidthAsQ = state.showBandwidthAsQ
    }

    func updatePeakLimiter(_ value: Bool) {
        peakLimiter = value
        var state = iQualizeState.load()
        state.peakLimiter = value
        state.save()
    }

    func updateMaxGainDB(_ value: Float) {
        maxGainDB = value
        var state = iQualizeState.load()
        state.maxGainDB = value
        state.save()
    }

    func updateAutoScale(_ value: Bool) {
        autoScale = value
        var state = iQualizeState.load()
        state.autoScale = value
        state.save()
    }

    func updatePreEqSpectrum(_ value: Bool) {
        preEqSpectrumEnabled = value
        var state = iQualizeState.load()
        state.preEqSpectrumEnabled = value
        state.save()
    }

    func updatePostEqSpectrum(_ value: Bool) {
        postEqSpectrumEnabled = value
        var state = iQualizeState.load()
        state.postEqSpectrumEnabled = value
        state.save()
    }

    func updateShowBandwidthAsQ(_ value: Bool) {
        showBandwidthAsQ = value
        var state = iQualizeState.load()
        state.showBandwidthAsQ = value
        state.save()
    }
}
