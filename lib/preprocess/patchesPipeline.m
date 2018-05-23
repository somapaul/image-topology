function [rawPatches, patches] = patchesPipeline(dim, imgPath, outPath)
    % main pipeline for patch sampling
    %   param dim is dimension of patch vectors (must be square integer)
    %   param imgPath is the directory where the images are stored
    %   param dataPath is the full path to the file to store the patches
    %   returns M_n a set of high contrast sqrt(dim) by sqrt(dim) pixel
    %       patches as dim-dimensional vectors
    
    n = 5000; 
    cut = 0.2; 
    %dim = 81;
    %imgPath = './van-hateren-images/';
    %dataPath = './patches/';
    
    % get high contrast n by n patches M_n
    [rawPatches, patches] = createPatchSample(n, cut, dim, imgPath);

    rawPatchesPixelate = pixelate(rawPatches, 81, 9);
    patchesPixelate = pixelate(patches, 81, 9);
    
    % save to txt files
    rawPatchesFile = strcat(outPath, '_raw');
    patchesFile = strcat(outPath, '_log_meansub_dNormalize');
    rawPatchesPixelateFile = strcat(outPath, '_raw_pixelated');
    patchesPixelateFile = strcat(outPath, '_log_meansub_dNormalize_pixelated');

    dlmwrite(rawPatchesFile, rawPatches, 'delimiter', ',', 'precision', 10);
    dlmwrite(patchesFile, patches, 'delimiter', ',', 'precision', 10);
    dlmwrite(rawPatchesPixelateFile, rawPatchesPixelate, 'delimiter', ',', 'precision', 10);
    dlmwrite(patchesPixelateFile, patchesPixelate, 'delimiter', ',', 'precision', 10);

end