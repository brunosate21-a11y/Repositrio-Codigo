rule memote:
    input:
        model  = "results/gems/{mag}.xml"
    output:
        report = "results/memote/{mag}/report.html",
        score  = "results/memote/{mag}/score.json"
    log:
        "logs/memote/{mag}.log"
    conda:
        "workflow/envs/memote.yaml"
    script:
        "workflow/scripts/memote.py"