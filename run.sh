GENERATOR_IMAGE="generator-image"
REPORTER_IMAGE="reporter-image"

case "$1" in

    build_generator)
        docker build -t $GENERATOR_IMAGE ./generator
        ;;

    run_generator)
        mkdir -p data
        docker run --rm \
            -v "$(pwd)/data:/data" \
            $GENERATOR_IMAGE
        ;;

    create_local_data)
        mkdir -p local_data
        python3 generator/generate.py local_data
        ;;

    build_reporter)
        docker build -t $REPORTER_IMAGE ./reporter
        ;;

    run_reporter)
        mkdir -p data
        docker run --rm \
            -v "$(pwd)/data:/data" \
            $REPORTER_IMAGE
        ;;

    structure)
        if command -v tree >/dev/null 2>&1; then
            tree
        else
            find .
        fi
        ;;

    clear_data)
        mkdir -p data
        rm -f data/*.csv
        rm -f data/*.html
        echo "Data directory cleaned"
        ;;

    inside_generator)
        mkdir -p data
        docker run --rm \
            -v "$(pwd)/data:/data" \
            --entrypoint ls \
            $GENERATOR_IMAGE \
            -la /data
        ;;

    inside_reporter)
        mkdir -p data
        docker run --rm \
            -v "$(pwd)/data:/data" \
            --entrypoint ls \
            $REPORTER_IMAGE \
            -la /data
        ;;

    *)
        echo "Usage:"
        echo "./run.sh build_generator"
        echo "./run.sh run_generator"
        echo "./run.sh create_local_data"
        echo "./run.sh build_reporter"
        echo "./run.sh run_reporter"
        echo "./run.sh structure"
        echo "./run.sh clear_data"
        echo "./run.sh inside_generator"
        echo "./run.sh inside_reporter"
        exit 1
        ;;

esac
