Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D34761BCBDA
	for <lists+linux-fbdev@lfdr.de>; Tue, 28 Apr 2020 21:01:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729105AbgD1TAQ (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Tue, 28 Apr 2020 15:00:16 -0400
Received: from userp2120.oracle.com ([156.151.31.85]:44940 "EHLO
        userp2120.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729263AbgD1S7R (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>);
        Tue, 28 Apr 2020 14:59:17 -0400
Received: from pps.filterd (userp2120.oracle.com [127.0.0.1])
        by userp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 03SItOrH087842;
        Tue, 28 Apr 2020 18:59:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=corp-2020-01-29;
 bh=6QfPBxRy5q90uwHDhwkUZK3Fz9TlbCsqwMzjQP33fAQ=;
 b=UuzYbl5loRqRRTDE3pzbcxlp8AoZsd2mvoJ5IB71FBYjz5pBLpDDzUZyWaQBT2lvObEw
 LMNmexC/MBYW6oGpPjUFxJexF9G+g5eX+ApuvTGiHNObigDRKRCrtV7fNs8dwZqKc0e3
 q7kiCkk8IKcNOoeNVRHkrcebK9bAG6Y2fFw7AFIynX7SnZ6CuSdhXJSQQ38BKV4b8qZr
 gLczAyd5Du1ZZKoFTJzvjv8NQuBt2J6TEg7wVambUY7Nn5XdJm5yb7YiRUnsMd6DsW8o
 QgFp9fYox5ki7zaFJ1j9l/ESOTzDx3cSpxxP3dZM2ykswoHJPbZwD+0Cwyw1uWC/oFqk yw== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
        by userp2120.oracle.com with ESMTP id 30p2p077g6-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Tue, 28 Apr 2020 18:59:07 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
        by aserp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 03SIv13j173815;
        Tue, 28 Apr 2020 18:59:06 GMT
Received: from userv0121.oracle.com (userv0121.oracle.com [156.151.31.72])
        by aserp3020.oracle.com with ESMTP id 30my0e1hmd-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Tue, 28 Apr 2020 18:59:06 +0000
Received: from abhmp0006.oracle.com (abhmp0006.oracle.com [141.146.116.12])
        by userv0121.oracle.com (8.14.4/8.13.8) with ESMTP id 03SIx1x2005370;
        Tue, 28 Apr 2020 18:59:01 GMT
Received: from kadam (/41.57.98.10)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Tue, 28 Apr 2020 11:59:01 -0700
Date:   Tue, 28 Apr 2020 21:58:54 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     Oliver Graute <oliver.graute@gmail.com>
Cc:     devel@driverdev.osuosl.org, linux-fbdev@vger.kernel.org,
        gregkh@linuxfoundation.org,
        Oliver Graute <oliver.graute@kococonnector.com>,
        linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v1] staging: fbtft: fb_st7789v: enabled inversion
Message-ID: <20200428185854.GK2014@kadam>
References: <1586424250-25897-1-git-send-email-oliver.graute@gmail.com>
 <20200409101517.GO2001@kadam>
 <20200427082939.GB18436@portage>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200427082939.GB18436@portage>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9605 signatures=668686
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0 spamscore=0
 suspectscore=0 adultscore=0 mlxlogscore=915 bulkscore=0 phishscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2003020000 definitions=main-2004280150
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9605 signatures=668686
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 phishscore=0 clxscore=1015
 bulkscore=0 adultscore=0 lowpriorityscore=0 impostorscore=0 malwarescore=0
 mlxscore=0 suspectscore=0 mlxlogscore=964 priorityscore=1501
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2003020000
 definitions=main-2004280149
Sender: linux-fbdev-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org

On Mon, Apr 27, 2020 at 10:29:39AM +0200, Oliver Graute wrote:
> On 09/04/20, Dan Carpenter wrote:
> > On Thu, Apr 09, 2020 at 11:24:05AM +0200, Oliver Graute wrote:
> > > From: Oliver Graute <oliver.graute@kococonnector.com>
> > > 
> > > Enable inversion mode
> > 
> > What the heck is an inversion mode and why would you want it?
> 
> 
> Should I name it:
> 
> Enable MIPI_DCS_ENTER_INVERT_MODE
> 

What I'm saying is the changelog should explain why would want to apply
the patch.  What does the inversion mode do?  Is it inverting the color
or flipping something upside down?

Probably if I had a background in graphics I would know what "Enable
inversion mode" means...  But three words is not a proper and complete
commit message normally.

regards,
dan carpenter

