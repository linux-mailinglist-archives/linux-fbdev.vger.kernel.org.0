Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1BC0055DC26
	for <lists+linux-fbdev@lfdr.de>; Tue, 28 Jun 2022 15:25:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234387AbiF0LDG (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Mon, 27 Jun 2022 07:03:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58274 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234208AbiF0LDF (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>);
        Mon, 27 Jun 2022 07:03:05 -0400
Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D76BE63DD
        for <linux-fbdev@vger.kernel.org>; Mon, 27 Jun 2022 04:03:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1656327779;
        bh=0ha3Qc5KZYDBb1KelKRriSZCCtYB9uIg1cWmbtEov6o=;
        h=X-UI-Sender-Class:Date:Subject:From:To:References:In-Reply-To;
        b=kmODS1LyKuos+bu4gBGLeOhMdifJ8OhwSrlO/VGWA8q6vrSD48TDdjZ20lo1KdEnL
         QtyHqEiM73gQDVqmLoP86Xms5ZSZkFo8i45a2PENWy7hiDleaDKKj5jOmDjMSvZMot
         ogHlGYg52d2xW32ModYbBN/aHxF+mrUID+IrM68M=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [192.168.20.60] ([92.116.176.39]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MZCfD-1oA1kx3T4T-00VBWr; Mon, 27
 Jun 2022 13:02:58 +0200
Message-ID: <7023507c-d9f9-6e70-b2bf-c3995a516649@gmx.de>
Date:   Mon, 27 Jun 2022 13:02:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH v6 0/4] fbcon: Fixes for screen resolution changes
Content-Language: en-US
From:   Helge Deller <deller@gmx.de>
To:     linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
        daniel.vetter@ffwll.ch
References: <20220626102853.124108-1-deller@gmx.de>
In-Reply-To: <20220626102853.124108-1-deller@gmx.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Provags-ID: V03:K1:XdnZ6Q294OZHs53Rio0ZelGeKKvGPa0znhC43duZ9RaiwiasppT
 LWVY6Ai7626NgElvrfbooJJRePb9uv2yML3lZxWVTXveO0qWUXwahnJnfoBTzAxyous0YfF
 MISZgU8hWjO80JTop6OS5DDZK1sLOr60OjoHklOZ6MsK0Ao9JyCPncr/rk5FROT1DxeP16Y
 2CA7QfEn4/qT27IB8auQg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:9YOCWXmXI2Q=:MbFYpDVwP5E3j//7wBUogR
 TQXiLoGunCaq4p9wAKN3bOd6TD55FkmWDvAAfaOsuUbU8JQa4ypNft2XVUiM/l1a+uq+azZwP
 vvbAEnTpUc1KCo8EwN1cO8UKTh6edZFHxVg6DJjGbeUtVfhVWDzyYsKEJF3bFGulPyUc84k1U
 EG6gW8QyAQswWhMaZ77FVuepTxzb7ZQOUmtCjoqqlmz/82HukfXN62P6URqIq5K5HP//tKvey
 ekj/KZXtQ+Vg2yCfEiCDZoIGapXES0PKaDaW1jNahRcBiM+RNbyn1TQDXDionC/SESdmDSebS
 AYte4wFwdxtGx3QHI8FMpi13an6DxaQpnncbr4CfFwBUqB3xQLenOKb2uV9EPIumIXBJsQ5Wc
 x5avOgVPnlKdwceC2nT4M2Rx5GhfWLkS7Ju+mvwngEbhnpSDftS9W+BkHluNHCWwzdR+/LdH5
 o8c1TBsa26NF9G4npKNX1f1NPN4Xc0XMaXKz3hr97ecE7pvDVQzgDfX8+9dWsH+4+5qX/W9Q1
 sEYy3i4h3fm/dVZXwg3DS8JX98T3ecNXDJj7kZUd8tFC1h752VYrTLQ/tHa9ntFdnj9TWyJA/
 drdPJKKY4nspuUJKphcWWGTYif4bLmuFO5ygqrIpPFF8zhSBSeYxaS5PxiXeaST9IwxDHIyeN
 OLnYeGvCWUZteOTeEVS70+Upk7tGWS/PQmDHlHC9svrfDUt86ifoDOIPAbZqeGUyki4v4+upr
 EzQc7Fi5q90xXuSZV3X8x0BhNZEruy0LxagTZzVYL38BqXyGk0HXFefITuH5Lusi6/8d1U6X9
 vigHMrK+JQ3Md2sJXPxz/Rz3om9aEARm3it/tFTTRSE5CH6bghYtZny4yLhYQB2FyklCZ5q81
 7BWD/IMFAuetqW7Co450FFpWB6vKfdBEP5CSAj7Zu0tdAKmQPxN4Zr37Mu0dTmiodAr7eEbmS
 jTx7ES/PvYUW4rMWUY+Uzf6PBgLiRekcvBGQomfVo8Xy6nVMNXIopPHBdMDFq4ug4BfTLh0W6
 qPOeoNZXMQ8cbD5UQ2jMhruxAC+Vl/4EjiP6PFqCS3T/aAdS1woejOhR1gDoTH7+4i0Bp3Ptj
 UdAcOxLkCguFFKgc/ZlNEEEgaq5DFsP1uzs
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,FREEMAIL_FROM,NICE_REPLY_A,RCVD_IN_DNSWL_LOW,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org

On 6/26/22 12:28, Helge Deller wrote:
> This series fixes possible out-of-bound memory accesses when users trigger
> screen resolutions changes with invalid input parameters, e.g. reconfigures
> screen which is smaller than the current font size, or if the virtual screen
> size is smaller than the physical screen size.

I've pull this series into the for-next branch of the fbdev git tree:
https://git.kernel.org/pub/scm/linux/kernel/git/deller/linux-fbdev.git/log/?h=for-next

Helge
